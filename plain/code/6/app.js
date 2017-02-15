(function () {
    'use strict';
    
    var app = angular.module('myApp', []);

    app.controller('testCtrl', function($scope, MyService) {
        $scope.message = MyService.sayHello();
    });

    app.service('MyService', function () {
      this.sayHello = function () {
        return 'Hello from service!!!'
      };
    });



})();
