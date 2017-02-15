var http = require('http');

var counter = 0;

function compute() {
        var now = new Date().getTime();
        while(new Date().getTime() < now+10000){           
        }
    
}

http.createServer(function(req, res) {
     res.writeHead(200, {'Content-Type': 'text/plain'});
     res.end('Hello World');
     //compute();
     process.nextTick(compute);
}).listen(5000, '127.0.0.1');


