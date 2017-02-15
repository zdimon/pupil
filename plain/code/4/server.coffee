express = require 'express'
fs = require 'fs'
app = express()

controllerFiles = fs.readdirSync('controllers');

controllerFiles.forEach (controllerFile)->
    if controllerFile.indexOf('.js') == -1
        return
    else      
        file = controllerFile.replace('.js', '')  
        ctrl = require('./controllers/' + file) 
        ctrl.setup app   
         
 
port = process.env.PORT || 8088
app.listen port
console.log 'I am gping on '+port
