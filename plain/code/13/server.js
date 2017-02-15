var express = require('express');
var redis = require('redis');

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);


var redisPub = redis.createClient();
var redisSub = redis.createClient();

io.on('connection', function(client){
    console.log('Client connected...');
    client.on('message',function(data){
        console.log(data);
        redisPub.publish('chat_messages',JSON.stringify(data));
    
    });
});
  

redisSub.subscribe('chat_messages');
redisSub.on('message',function(channel,msg){
    console.log('emmit');
    io.emit('message', msg);
});





    
app.use('/', express.static(__dirname));
app.get('/', function(req, res) {
    res.sendFile(__dirname + '/chat.html');
});

app.get('/get', function(req, res) {
    client.get('mes',function(err,reply){
       res.end(reply);  
    });
});

http.listen(8080, function(){
  console.log('listening on *:8080');
});


