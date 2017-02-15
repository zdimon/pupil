var a = 1;

function f(){
    var x = 3;
    console.log(x);
    function b(){
        var x = 4;
        a = 12;
        console.log(x);
    }
    b();
};

    f();
    console.log(a);
/*
    var x = 0;

    function f(){
        var x = 1;
        console.log(x);
    };

    console.log(x);
    f();

    console.log(a); 
    var a=1;         
    delete a;
    console.log(a); 

    function x() {
      y = 1;   // Throws a ReferenceError in strict mode
      var z = 2;
    }

    x();

    console.log(y); // logs "1" 
    console.log(z);
*/
