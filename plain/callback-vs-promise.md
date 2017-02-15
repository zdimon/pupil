##Content

    var express = require('express');
    var app = express();
    app.use('/', express.static(__dirname));
    app.get('/', function(req, res) {
        res.sendFile(__dirname + '/callback-promise.html');
    });
    app.listen(8080);
    console.log('run on 8080');


##Callback approach

    $scope.go_callback = function(){
        console.log('go with callback');
        $.get('one.txt', function(res,status){
            json = JSON.parse(res);
            console.log(json);
            console.log(status);
            $.get('two.txt', function(res,status){
                console.log(res);
            }); 
        });                 
    };    
    
    
##Promise

    promise.then().then().then()
    
    ...then(onFulfilled, onRejected)
    
    
       $http.get('one.txt').then(
         function(r){
            console.log(r);
         }    
       )    
    
        $scope.go_promise = function(){
           console.log('go with promise');
           $http.get('one.txt').then(
             mypromise   
           ).then(
             function(){
                console.log('ddd');
             }
           );
        };      
    
    
        var mypromise = function(){
            var deferred = $q.defer();
            deferred.resolve('Hello, from promise!');       
            return deferred.promise;
        };    
    
    
        var mypromise = function(){
            var deferred = $q.defer(); 
            $timeout(function() {
              deferred.resolve('Hello, from promise!');
            }, 1000);                
            return deferred.promise;
        };     
    
###  resolve and reject
    
        var mypromise = function(flag){
            var deferred = $q.defer();
                          
            if(flag=='0') {
                deferred.resolve('Yes!!'); 
            } else {
                deferred.reject('No!');
            }      
    
 
    
    
    
    
    
    
    
