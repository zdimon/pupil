// Generated by CoffeeScript 1.10.0
(function() {
  exports.setup = function(app) {
    return app.get('/contact', function(req, res) {
      return res.send([
        {
          'id': 1,
          'name': 'Piter',
          'phone': '342534'
        }, {
          'id': 2,
          'name': 'John',
          'phone': '842534'
        }, {
          'id': 3,
          'name': 'Mike',
          'phone': '642534'
        }
      ]);
    });
  };

}).call(this);
