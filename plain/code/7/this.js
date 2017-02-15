point = {
    x: 0,
    y: 0,
    draw: function(){
        console.log( 'X:'+this.x+'   Y:'+this.y )
    }
}



point = {
    new: function(x,y){
        this.x = x;
        this.y = y;
        return this;
    },
    x: 0,
    y: 0,
    draw: function(){
        console.log( 'X:'+this.x+'   Y:'+this.y )
    }
}

line = {
    xx: 0,
    yy: 0,
};

line.__proto__ = point;





function Point(x, y) {
    this.x = x;
    this.y = y;
    this.draw = function(){
        console.log('X:'+this.x+'   Y:'+this.y);
    };  
    
}



function Line(x,y,xx,yy){

    Point.apply(this, arguments);
    console.log(this);
    this.ldraw = function(){
        console.log('XX:'+this.x+'   YY:'+this.y);
    }; 
}
console.log(this);
Line.prototype = new Point

l = new Line(3,4,5,6)

console.dir(l)
l.draw()
l.ldraw()






