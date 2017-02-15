http = require 'http'
fs = require 'fs'
url = require 'url'
pathutil = require 'path'

mimeTypes = {
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.html': 'text/html'
}


server = http.createServer((req,res)->
    path = url.parse(req.url).pathname
    if path =='/' 
        path = '/routing.html'
    ext = pathutil.extname(path)
    mime = mimeTypes[ext]
    #remove slash
    path = path.substring(1,path.lenght)
    console.log(path)

    fs.readFile(path,'utf8',(err,data)->
        if err 
            console.log('I can not find '+path)
        else 
            res.writeHead(200,{'Content-Type': mime})
            res.end(data)
        
    )

    
)
server.listen(8080)
console.log('Server running on 8080')


