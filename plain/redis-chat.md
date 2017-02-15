##Redis chat

     npm install socket.io angular-socket-io --save

     <script src="/node_modules/socket.io/node_modules/socket.io-client/dist/socket.io.min.js"></script>    
    
     <script src="node_modules/angular-socket-io/socket.min.js"></script>   
     
     ['btford.socket-io']
     
    .factory('sock', function(socketFactory){
        return socketFactory()
        }
    )
    
    
##Node

    var app = require('express')();
    var http = require('http').Server(app);
    var io = require('socket.io')(http);
    
    .....
    
    http.listen(8080, function(){
      console.log('listening on *:8080');
    });    
    
    
##Handle connection


        io.on 'connection', (client)->
            console.log('Client connected...')   
            
##Subscribe on event            
            
    client.on('message',function(data){
        console.log(data);   
    });            
           
##Send a message from client.   
           
           
    $scope.send = function(){
        sock.emit('message',{message: 'helllooooo'});
    };
    
    
##SUB end PUB clients


    var redisPub = redis.createClient();
    var redisSub = redis.createClient();


    client.on('message',function(data){
        redisPub.publish('chat_messages',JSON.stringify(data));
    });
    

    redisSub.subscribe('chat_messages');
    redisSub.on('message',function(channel,msg){
        io.emit('message', msg);
    });
    
            
##Catch  message from client          
                       
                       
    sock.on('message',function(msg){
        console.log(msg);
    });           
   
   
##Broadcasting


    .factory('sock', function(socketFactory,$rootScope){
        sock =  socketFactory();
        sock.on('message',function(msg){
               $rootScope.$broadcast('got_message',msg);
            });
        return sock;
        

   
            
             