// Generated by CoffeeScript 1.10.0
(function() {
  angular.module(myApp, []).controller('myCtrl', function($scope) {
    $scope.contacts = ['Dima', 'Vova'];
    return $scope.add = function() {
      return $scope.contacts.push($scope.newcontact);
    };
  });

}).call(this);
