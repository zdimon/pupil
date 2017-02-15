f = function f(x,y){
    str = 'my args: '+x+','+y+' this: '+this;
    console.log(str);

};

f(1,2);

f.call(0,1,2)

f.call({},1,2)

f.call(function(){},1,2)
