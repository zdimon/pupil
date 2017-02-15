express = require 'express'
fs = require 'fs'
path = require 'path'
app = express()
port = process.env.PORT || 5555
app.get('/', (req,res)->
    fs.readFile('index.html','utf8',(err,data)->
        if err 
            console.log('I can not find index.html')
        else 
            res.send(data)
        
    )
)
app.get('/contacts', (req,res)->
    res.send([
                {'id': 1, 'name': 'Piter', 'phone': '342534'},
                {'id': 2, 'name': 'John', 'phone': '842534'},
                {'id': 3, 'name': 'Mike', 'phone': '642534'},
             ])
)
app.use(express.static(__dirname))
app.listen port
console.log 'I am going on '+port
