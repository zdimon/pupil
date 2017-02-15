    var foo = function(par) {
        console.log('anonimus-'+par)
    };

    var x = function bar(par){
        console.log('named-'+par)
    };   

    foo('hello');
    x('hello');
