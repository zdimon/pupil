    var add = function add(a, b) {
        return a + b;
    };
    console.log(add.name)


    function writeCode(callback) {
    
        callback();

    };


    function hwoAreYou() {
        console.log('I am callback func!!!!');
    }

    writeCode(hwoAreYou);


    function findLi() {       
        var nodes = [];
        var ul = document.getElementById('myList');
        var items = ul.getElementsByTagName("li");
        for (var i = 0; i < items.length; ++i) {
          console.log(items[i]);
          nodes.push(items[i]);
        };
        return nodes;
    }

    var hide = function (nodes) {
    var i = 0, max = nodes.length;
        for (; i < max; i += 1) {
            console.log(nodes[i]);
            nodes[i].style.display = 'none';
        }
    };

    function go(){
        var start = new Date().getTime();
        hide(findLi());
        var end = new Date().getTime();
        var time = end - start;
        console.log('it takes-'+time+' msec');
    }

    var button = document.getElementById('go');
    button.addEventListener('click', go, false);

//////////////////////////////////////////

    function findLiWithCallback(callback) {       
        var nodes = [];
        var ul = document.getElementById('myList');
        var items = ul.getElementsByTagName("li");
        for (var i = 0; i < items.length; ++i) {
          console.log(items[i]);
          nodes.push(items[i]);
          callback(items[i]);
        };
        return nodes;
    }

    var hide_callback = function (node) {
            node.style.display = 'none';
    };

    function go_callback(){
        var start = new Date().getTime();
        findLiWithCallback(hide_callback);
        var end = new Date().getTime();
        var time = end - start;
        console.log('it takes-'+time+' msec');
    }

    var button_callback = document.getElementById('go_callback');
    button_callback.addEventListener('click', go_callback, false);


    var tick = function () {
    console.log('5000ms later...');
    };
    setTimeout(tick, 5000);



