var express = require('express');
var app = require('express')();
var http = require('http').Server(app);
    
app.use('/', express.static(__dirname));
app.get('/', function(req, res) {
    res.sendFile(__dirname + '/directives.html');
});

http.listen(8080, function(){
  console.log('listening on *:8080');
});


