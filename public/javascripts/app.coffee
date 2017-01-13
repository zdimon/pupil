angular.module('pupilApp', ['ngRoute'])
.config ($routeProvider,$locationProvider)->
    $routeProvider
    .when '/',
        templateUrl : 'pages/users.html'
        controller  : 'userCtrl'
    .when '/page',
        templateUrl : 'pages/page.html'
        controller  : 'pageCtrl'
    .otherwise
        redirectTo: '/'

    $locationProvider.hashPrefix('')
