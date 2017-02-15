'use strict';
var http = require('http');
var fs = require('fs');
var pathutil = require('path');
var url = require('url');

var mimeTypes = {
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.html': 'text/html',
    '.png': 'image/png'
}


var server = http.createServer(function(req,res){
            var path = url.parse(req.url).pathname;
            if (path =='/') path = '/angular/index.html';
            var ext = pathutil.extname(path);
            var mime = mimeTypes[ext]; 
            // remove slash
            path = path.substring(1,path.lenght);
            var content = fs.readFileSync(path);
            res.writeHead(200,{'Content-Type': mime});
            res.end(content);
        
    });

server.listen(8080);
console.log('Server running on 8080');


