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

##
