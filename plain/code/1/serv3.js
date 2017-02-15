'use strict';
var http = require('http');
var fs = require('fs');
var filename = 'index.html';
var server = http.createServer(function(req,res){

    fs.readFile(filename,'utf8',function(err,data){
        if(err){
            console.log('Error');
            res.writeHead(400);
            res.end();
        } else {
            res.writeHead(200,{'Content-Type': 'text/html'});
            res.end(data);
        }
    });
});
server.listen(8080);
console.log('Server running on 8080');
