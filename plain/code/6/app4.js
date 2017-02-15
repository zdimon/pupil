(function () {
    'use strict';
    
    var app = angular.module('myApp', []);

    app.controller('testCtrl', function($scope, MyFactory, MyService) {

        $scope.update_by_factory = function() {
            $scope.message = MyFactory.sayHello($scope.myname);
        }

        $scope.update_by_service = function() {
            $scope.message = MyService.sayHello($scope.myname);
        }


        $scope.message = MyFactory.sayHello($scope.myname);
    });

    app.factory('MyFactory', function () {
      console.log('factory');
      return {
        sayHello: function (name) {
          return 'Hello '+name+' from factory!!!'
        }
      }
    });

    app.service('MyService', function () {
      console.log('service');
      this.sayHello = function (name) {
        return 'Hello '+name+' from service!!!'
      };
    });




})();
