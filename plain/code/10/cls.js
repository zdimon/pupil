// Generated by CoffeeScript 1.11.1
(function() {
  var Animal, Cat, a, c, j, len, s,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Animal = (function() {
    function Animal(attributes) {
      this.attributes = attributes;
      console.log(this.attributes);
    }

    Animal.prototype.move = function(meters) {
      return " '" + this.attributes.name + "' moved " + meters;
    };

    Animal.prototype["do"] = function() {
      return console.log('I do');
    };

    return Animal;

  })();

  a = new Animal('Just animal');

  a.move(200);

  Cat = (function(superClass) {
    extend(Cat, superClass);

    function Cat() {
      return Cat.__super__.constructor.apply(this, arguments);
    }

    Cat.prototype.sayName = function() {
      return console.log(this.attributes.name);
    };

    Cat.prototype.move = function() {
      var par;
      par = Cat.__super__.move.apply(this, arguments);
      return console.log('ssssss');
    };

    Cat.givemeten = function() {
      var i, j, ret;
      ret = [];
      for (i = j = 1; j <= 10; i = ++j) {
        console.log('append');
        ret.push(new Cat({
          name: 'Dima'
        }));
      }
      return ret;
    };

    return Cat;

  })(Animal);

  c = new Cat({
    name: 'Vasya'
  });

  s = c.givemeten();

  for (j = 0, len = s.length; j < len; j++) {
    c = s[j];
    console.log(c);
    c["do"]();
  }

}).call(this);
