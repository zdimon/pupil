// Generated by CoffeeScript 1.11.1
(function() {
  var express, multer, path, router, storage, upload;

  express = require('express');

  router = express.Router();

  multer = require('multer');

  path = require('path');

  storage = multer.diskStorage({
    destination: './uploads',
    filename: function(req, file, cb) {
      return cb(null, (Math.random().toString(36) + '00000000000000000').slice(2, 10) + Date.now() + path.extname(file.originalname));
    }
  });

  upload = multer({
    storage: storage
  });

  router.get('/', function(req, res, next) {
    return res.render('layout');
  });

  router.post('/upload', upload.any(), function(req, res, next) {
    return res.json({
      'message': 'ok'
    });
  });

  module.exports = router;

}).call(this);
