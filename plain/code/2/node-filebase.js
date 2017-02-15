'use strict';
var http = require('http');
var fs = require('fs');
var url = require('url');
var pathutil = require('path');
var filename = 'data.json';

var filedata;

      fs.open(filename,'r',function(err, data){
        if (err) {
          fs.writeFile(filename, '{"pages": {"about": "about us", "contact": "contact us"}}', function(err) {
              if(err) {
                  console.log(err);
              }
              console.log("The file was saved!");
          });
        } else {
          console.log("The file exists!");
          fs.readFile(filename, 'utf8', function (err,data) {
              if (err) {
                return console.log(err);
              }
              
              filedata = data;
              console.log(filedata);
           });
          console.log(data);
        }
      });
      
  
  var mimeTypes = {
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.html': 'text/html',
    '.png': 'image/png'
}

var server = http.createServer(function(req,res){




    var path = url.parse(req.url).pathname;
    if (path =='/') path = '/index.html';
    // get extention
    var ext = pathutil.extname(path);
    var mime = mimeTypes[ext]; 
    // remove slash
    path = path.substring(1,path.lenght);
    console.log('we have got request '+path);
    
    if(path== 'list')
    {
       console.log('dddd');
       console.log(filedata);
	   res.end(filedata);
 
    	
    } else {

        fs.readFile(path,'utf8',function(err,data){
            if(err){
                console.log('I can not find '+path);
                res.end();

            } else {
                res.writeHead(200,{'Content-Type': mime});
                res.end(data);
            }
        });
     }
    
});
server.listen(8080);
console.log('Server running on 8080');