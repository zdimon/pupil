##Authentication 

https://scotch.io/tutorials/authenticate-a-node-js-api-with-json-web-tokens


    npm install express body-parser morgan mongoose jsonwebtoken --save

    **express** is the popular Node framework

    **mongoose** is how we interact with our MongoDB database

    **morgan** will log requests to the console so we can see what is happening

    **body-parser** will let us get parameters from our POST requests

    **jsonwebtoken** is how we create and verify our JSON Web Tokens


##Configuration 

    module.exports =
        'secret': 'kuku'
        'database': 'mongodb://localhost/simpleapp'

    ###app.coffee
    mongoose = require 'mongoose'
    config = require './config'
    User = require './user_model'
    mongoose.connect config.database


##Model

    mongoose = require 'mongoose'
    Schema = mongoose.Schema


    module.exports = mongoose.model 'User', new Schema  
        name: String
        password: String
        admin: Boolean 

##Setup request


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


##Show users

    app.get '/allusers', (req, res)->
        User.find {}, (err, users)-> 
            res.json users


##Authentication request

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
          
##Midlware to check token.    


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


###Bootstrap login form
    
    form(class="navbar-form navbar-right" action="/login" method="POST")
        
        div.form-group
            input(name="name" type="text")

        div.form-group
            input(name="password" type="password")
       
        div.form-group
            button(type="submit" name="enter" class="btn btn-success") Signin
       

##Factory

    .factory 'LoginFactory', ($http)->
        login = (login,password,callback)->
            data = {name: login, password: password}
            $http.post('/login', data).then callback
        return {login: login}    


##Service

###Callback realization

    .service 'LoginService', [ '$http', class Login
            constructor: (@$http)->
            login: (login,password,callback)->
                data = {name: login, password: password}
                @$http.post('/login', data).then callback
        ]


    LoginService.login $scope.username, $scope.password, (rez)->
        $scope.message = rez.data

###Promise realization

    .service 'LoginService', [ '$http', class Login
            constructor: (@$http)->
            login: (login,password,callback)->
                data = {name: login, password: password}
                promise = @$http.post('/login', data).then (rez)->
                    rez.data
                promise
        ]

    LoginService.login($scope.username, $scope.password).then (rez)->
        $scope.message = rez    


## Message

    span(style="color: red" ng-show="is_error") {{ error_message }}

    
    ....
    if not $scope.message.success
        $scope.is_error = true
        $scope.error_message = $scope.message.message
