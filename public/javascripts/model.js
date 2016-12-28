(function () {
  'use strict';

  angular
    .module('pupilApp')
    .factory('Model', Model);

  Model.$inject = ['$http'];

  function Model($http) {

    var Model = {
      get_user_list: get_user_list,
      save: save,
      remove: remove
    };

    return Model;

/*
    function get_user_list(callback) {
      var url = 'users.json'
      return $http.get(url).then(callback);
  };
*/

    function get_user_list() {
      var url = 'users.json'
      var promise = $http.get(url).then(function(response){
          return response.data;
      });
      return promise;
    };

    function remove(id,callback) {
      var url = 'users/remove/'+id
      return $http.get(url).then(callback);
    };
 

    function save(user,callback) {
        var url = 'users/save';
        return $http.post(url,user).then(callback);
    };

  }



})();
