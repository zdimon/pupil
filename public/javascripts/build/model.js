// Generated by CoffeeScript 1.12.2
(function() {
  var Model;

  Model = function($http) {
    var get_user_list, remove, save;
    get_user_list = function(callback) {
      var url;
      url = 'users.json';
      return $http.get(url).then(callback);
    };
    remove = function(id, callback) {
      var url;
      url = 'users/remove/' + id;
      return $http.get(url).then(callback);
    };
    save = function(user, callback) {
      var url;
      url = 'users/save';
      return $http.post(url, user).then(callback);
    };
    Model = {
      get_user_list: get_user_list,
      save: save,
      remove: remove
    };
    return Model;
  };

  Model.$inject = ['$http'];

  angular.module('pupilApp').factory('Model', Model).factory('Page', [
    '$http', '$rootScope', function($http) {
      var del, get, list, save;
      list = function(cb) {
        return $http.get('/pages/list').then(cb);
      };
      save = function() {
        return console.log('save');
      };
      del = function() {
        return console.log('delete');
      };
      get = function() {
        return console.log('get');
      };
      return {
        list: list,
        save: save,
        del: del,
        get: get
      };
    }
  ]);

}).call(this);
