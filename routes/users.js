// Generated by CoffeeScript 1.11.1
(function() {
  var ObjectLength, addUser, express, fs, getUsers, router, saveUsers;

  express = require('express');

  router = express.Router();

  fs = require('fs');

  fs.exists(global.appRoot + '/public/users.json', function(exists) {
    if (!exists) {
      return fs.writeFile(global.appRoot + '/public/users.json', '{}', function(err, data) {
        return console.log('Database was created!!!!');
      });
    }
  });

  router.get('/remove/:id', function(req, res, next) {
    var obj;
    obj = getUsers();
    delete obj[req.params.id];
    saveUsers(obj);
    return res.send('ok');
  });

  getUsers = function() {
    return JSON.parse(fs.readFileSync(global.appRoot + '/public/users.json', 'utf8'));
  };

  saveUsers = function(obj) {
    return fs.writeFile(global.appRoot + '/public/users.json', JSON.stringify(obj), function(err) {
      if (err) {
        return console.log(err);
      }
      return console.log("The file was saved!");
    });
  };

  ObjectLength = function(object) {
    var i, key, len, max;
    max = 0;
    for (i = 0, len = object.length; i < len; i++) {
      key = object[i];
      console.log(key);
      if (key > max) {
        max = key;
      }
    }
    return parseInt(max);
  };

  addUser = function(obj, data) {
    var id;
    console.dir();
    if (data.is_edit) {
      id = data.id;
    } else {
      id = ObjectLength(obj) + 1;
    }
    return obj[id] = {
      id: id,
      name: data.name,
      email: data.email,
      about: data.about,
      date: data.date,
      is_married: data.is_married
    };
  };

  router.post('/save', function(req, res, next) {
    var obj;
    obj = getUsers();
    addUser(obj, req.body);
    saveUsers(obj);
    return res.send('ok');
  });

  module.exports = router;

}).call(this);