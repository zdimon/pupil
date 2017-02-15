'use strict';
var http = require('http');
var fs = require('fs');
var url = require('url');
var filename = 'index2.html';
var server = http.createServer(function(req,res){
    var path = url.parse(req.url).pathname;
    console.log('we have got request '+path);
    fs.readFile(filename,'utf8',function(err,data){
        if(err){
            console.log('Error');
            
        } else {
            res.writeHead(200,{'Content-Type': 'text/html'});
            res.end(data);
        }
    });
});
server.listen(8080);
console.log('Server running on 8080');
