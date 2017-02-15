'use strict';
var http = require('http');
var fs = require('fs');
var url = require('url');
var pathutil = require('path');

var fs = require("fs");
var file = "test.db";
var exists = fs.existsSync(file);
var sqlite3 = require("sqlite3").verbose();
var db = new sqlite3.Database(file);
  /*
db.serialize(function() {
  if(!exists) {
    db.run("CREATE TABLE Stuff (thing TEXT)");
  }
  
        var stmt = db.prepare("INSERT INTO Stuff VALUES (?)");

//Insert random data
  var rnd;
  for (var i = 0; i < 10; i++) {
    rnd = Math.floor(Math.random() * 10000000);
    stmt.run("Thing #" + rnd);
  }
  
stmt.finalize();
  db.each("SELECT rowid AS id, thing FROM Stuff", function(err, row) {
    console.log(row.id + ": " + row.thing);
  });



});
*/

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
      var lst = [];
      
      db.all("SELECT rowid AS id, thing FROM Stuff",function(err,rows){
       //res.json({ "phones" : rows });
       var out = JSON.stringify({rows: rows});
       console.log(out);
	   res.end(out);
	 });

	 
    	
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
