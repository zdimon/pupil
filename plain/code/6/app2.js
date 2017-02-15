(function () {
    'use strict';
    
    var app = angular.module('myApp', []);

    app.controller('testCtrl', function($scope, MyFactory) {
        $scope.message = MyFactory.sayHello();
    });

    app.factory('MyFactory', function () {
      return {
        sayHello: function () {
          return 'Hello from factory!!!'
        }
      }
    });



})();
