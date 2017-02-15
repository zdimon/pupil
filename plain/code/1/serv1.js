var http = require('http');
var server = http.createServer(function(req,res){
    console.log('Server started');
});
server.listen(8080);
