connect = require 'connect'
http = require 'http'
app = connect()
app
.use (req,res,next)->
    console.log 'one'
    next()
.use (req,res,next)->
    console.log 'two'
    next()
.use (req,res,next)->
    res.write JSON.stringify {x: 10, y: 40}
    res.end() 
    
http.createServer(app).listen(8080)
