// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('scopeApp', []).controller('FirstController', function($scope, $rootScope) {
    $scope.setmyname = function() {
      return $scope.myname = 'Dima';
    };
    return $scope.setglobalname = function() {
      return $rootScope.globalname = 'WORLD';
    };
  }).controller('SecondController', function($scope) {
    return $scope.sethisname = function() {
      return $scope.hisname = 'VOVA PUTIN';
    };
  });

}).call(this);
