##Redis server

    apt-get install redis-server
    
    sudo service redis-server stop
    sudo service redis-server start
    
##Connect

    var redis = require("redis"),
    client = redis.createClient();
    
##Set data

    client.set("mes", "OK");                                       
                                    
##Get data                                  

    app.get('/get', function(req, res) {
        client.get('mes',function(err,reply){
           res.end(reply);  
        });
    });


##GUI client RDM