// Generated by CoffeeScript 1.10.0
(function() {
  var app, controllerFiles, express, fs, port;

  express = require('express');

  fs = require('fs');

  app = express();

  controllerFiles = fs.readdirSync('controllers');

  controllerFiles.forEach(function(controllerFile) {
    var ctrl, file;
    if (controllerFile.indexOf('.js') === -1) {

    } else {
      file = controllerFile.replace('.js', '');
      ctrl = require('./controllers/' + file);
      return ctrl.setup(app);
    }
  });

  port = process.env.PORT || 8088;

  app.listen(port);

  console.log('I am gping on ' + port);

}).call(this);
