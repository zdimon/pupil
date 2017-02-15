'use strict';
var http = require('http');
var fs = require('fs');
var url = require('url');
var pathutil = require('path');

var mimeTypes = {
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.html': 'text/html',
    '.png': 'image/png'
}

var server = http.createServer(function(req,res){
    var path = url.parse(req.url).pathname;
    if (path =='/') path = '/index2.html';
    // get extention
    var ext = pathutil.extname(path);
    var mime = mimeTypes[ext]; 
    // remove slash
    path = path.substring(1,path.lenght);
    console.log('we have got request '+path);
    if(ext == '.png'){
        var img = fs.readFileSync('./'+path);
                res.writeHead(200,{'Content-Type': mime});
                res.end(img,'binary');        
    } else {
        fs.readFile(path,'utf8',function(err,data){
            if(err){
                console.log('I can not find '+path);
                
            } else {
                res.writeHead(200,{'Content-Type': mime});
                res.end(data);
            }
        });
    }
});
server.listen(8080);
console.log('Server running on 8080');
