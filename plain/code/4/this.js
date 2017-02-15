m = function(){
    console.log(this);
};
m();
console.log(typeof m);

q = new function(){
    
    this.show = function(){
          console.log(this);  
    }
};
q.show();
console.log(typeof q);

myobj = {};
myobj.color = 'red';
myobj.showcolor = function(){
    console.log(this.color);
};
myobj.showcolor();
