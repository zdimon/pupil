connect = require 'connect'
http = require 'http'
app = connect()
.use( 
        (req, res, next)->
            console.log('First middleware')
            res.name = 'Dima'
            next()
    )
.use(
        (req,res,next)->    
            console.log("Second middleware #{res.name}")     
            next()
    )
.use(
        (req,res,next)->    
            console.log('end')     
            res.end 'hello world'
    )

http.createServer(app).listen(3333)
    
