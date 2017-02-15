'use strict';
var http = require('http');
var fs = require('fs');
var url = require('url');

var server = http.createServer(function(req,res){
    var path = url.parse(req.url).pathname;
    if (path =='/') path = '/index2.html';
    // remove slash
    path = path.substring(1,path.lenght);
    console.log('we have got request '+path);
    fs.readFile(path,'utf8',function(err,data){
        if(err){
            console.log('I can not find '+path);
            
        } else {
            res.writeHead(200,{'Content-Type': 'text/html'});
            res.end(data);
        }
    });
});
server.listen(8080);
console.log('Server running on 8080');
