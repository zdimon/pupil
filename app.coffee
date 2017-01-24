express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
global.appRoot = path.resolve __dirname
color = require 'cli-color'
fs = require 'fs'
exec = require('child_process').exec;    

jwt = require 'jsonwebtoken'
mongoose = require 'mongoose'
config = require './config'
User = require './user_model' 
mongoose.connect config.database
  
console.log config  

 

routes = require './routes/index'
users = require './routes/users'
pages = require './routes/pages'

app = express()


fs.lstat global.appRoot+'/public/node_modules', (err, stats)->
    if err
        cmd = "ln -s #{global.appRoot}/node_modules public/node_modules"
        exec cmd, (err,stdout, stdin)->
            console.log stdout
            console.log 'create simlink'



#Build coffeescripts

#cmd = "coffee -c  -o #{global.appRoot}/public/javascripts/build/ #{global.appRoot}/public/javascripts/"
#exec cmd, (err,stdout, stdin)->
#    console.log color.red('Compilation of the frontend coffeescripts is done!')



 

# view engine setup
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

# uncomment after placing your favicon in /public
# app.use favicon "#{__dirname}/public/favicon.ico"
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded
  extended: false
app.use cookieParser()
app.use express.static path.join __dirname, 'public'


apiRoutes = express.Router()
apiRoutes.use (req, res, next)->
    token = req.body.token || req.query.token || req.headers['x-access-token']
  
    if token
        jwt.verify token, 'secret', (err, decoded)->
            if err
                res.json
                    success: false
                    message: 'Failed to authenticate token'
            else
                # if everything is good, save to request for use in other routes
                req.decoded = decoded 
                next()
    else
        res.status(403).send 
            success: false
            message: 'No token provided.' 
    
app.use('/api', apiRoutes);

app.use '/', routes
app.use '/users', users
app.use '/pages', pages


app.get '/setup', (req, res)->

    #create a sample user 
    dima = new User  
        name: 'Dima' 
        password: '123'
        admin: true 
        

    #save the sample user
    dima.save (err)->
        if err
            throw err 

        console.log 'User saved successfully'
        res.json { success: true }


app.get '/allusers', (req, res)->
    User.find {}, (err, users)-> 
        res.json users


app.post '/login', (req, res)->
    #find the user
    console.log req.body.name
    User.findOne 
        name: req.body.name
    , (err, user)-> 
        if err
            throw err

        if not user 
            res.json 
                success: false
                message: 'Authentication failed. User not found.'
        else if user

            #check if password matches
            if user.password != req.body.password
                res.json 
                    success: false
                    message: 'Authentication failed. Wrong password.'
            else
                # create a token
                token = jwt.sign user, 'secret', {
                      expiresIn: '2 days'
                }

                # return the information including token as JSON
                res.json 
                  success: true
                  message: 'Enjoy your token!'
                  token: token


# catch 404 and forward to error handler
app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

# error handlers

# development error handler
# will print stacktrace
if app.get('env') is 'development'
    app.use (err, req, res, next) ->
        res.status err.status or 500
        res.render 'error',
            message: err.message,
            error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
        message: err.message,
        error: {}

module.exports = app
