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

app.use '/', routes
app.use '/users', users
app.use '/pages', pages

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
