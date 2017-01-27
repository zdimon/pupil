##Connect middleware.

    npm install connect --save

    connect = require 'connect'
    http = require 'http'
    app = connect()
    app
    .use (req,res,next)->
        console.log 'one'

    http.createServer(app).listen(8080)


##Chain

    .use (req,res,next)->
        console.log 'one'
        next()
    .use (req,res,next)->
        console.log 'two'
        next()
    .use (req,res,next)->
        res.end {x: 10, y: 40}


##URL handler

    .use '/auth', (req,res,next)->
        ...

##Adding services

###Compression

    npm install compression --save

    .use compression()

###Logger

    logger = require 'morgan'
    ...
    .use logger()

###Static files

    npm install serve-static --save

    .use serveStatic(__dirname)

###Cookie

    cookieParser = require 'cookie-parser'

    .use cookieParser()

###Basic authentication

    npm install basic-auth-connect --save

    .use basicAuth('1', '2')

###Session

    npm install cookie-session --save

    .use cookieSession
        key: 'my_key'
        secret: 'sekret'
        maxAge: 60*60*24

    ###add
    .use '/sess_add', (req,res,next)->
        req.session.foo = 'Hello'
        res.end 'done add'
    ##delete
    .use '/sess_del', (req,res,next)->
        delete req.session.foo
        res.end 'done del'
    ##get
    .use '/sess_del', (req,res,next)->
        console.log req.session
        next()

###Custom middleware

    module.export is_auth = (pars)->
        ()->
            consolw.log pars



    is_auth = (pars)->
        query = (req,res,next)->
            console.log 'Authentication'
            next()
        return query

    module.exports = is_auth


    # module.exports = is_auth()
    # module.exports.is_auth = is_auth
