// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('routingApp', ['ngRoute']).config(function($routeProvider) {
    return $routeProvider.when('/', {
      templateUrl: 'pages/home.html',
      controller: 'mainController'
    }).when('/contact', {
      templateUrl: 'pages/contact.html',
      controller: 'contactController'
    }).when('/about', {
      templateUrl: 'pages/about.html',
      controller: 'aboutController'
    });
  }).controller('mainController', function($scope) {
    return $scope.content = 'Everyone come and see how good I look!';
  }).controller('aboutController', function($scope) {
    return $scope.content = 'I am nice!';
  }).controller('contactController', function($scope, $http) {
    $scope.content = 'Tell me something';
    return $http.get('/contacts').success(function(result) {
      $scope.contacts = result;
      return console.log($scope.contacts);
    });
  }).run(function($rootScope, $location) {
    return $rootScope.isActive = function(viewlocation) {
      return viewlocation === $location.path();
    };
  });

}).call(this);
