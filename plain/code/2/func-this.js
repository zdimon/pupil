/*jshint unused:false*/
(function () {
    'use strict';
    var user = function (name) {
        var username, inf;
        var dd='fffffffffffffffffffff';
        username = name;
        inf = function () {
            return this.username;
        };
        /*
        this.inf = function(){
            console.log('ddsfsfsdfdsfs');
        };
        */
        return inf;
    };
    console.log(user.dd);
    var u = user('dima');

    console.log(u.apply({username: 'ddddd'},[]));
    
    
    var obj = {
    
        name: "blabla",
        say: function(){
            console.log(this.name);
        }
    
    }
    
    obj.say();
    
    
        var f = function(){
        var invar = 'lalalala';
        return function() {
            console.log(invar);
        }
    
    }
    
    f()();
    
    
}());


