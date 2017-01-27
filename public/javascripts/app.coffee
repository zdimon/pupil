angular.module('pupilApp', ['ngRoute', 'ngRoute.middleware', 'angularFileUpload', 'firebase'])
.config ($routeProvider,$locationProvider, $middlewareProvider)->

    $middlewareProvider
    .map
        'log': [ '$log', ($log)->
            $log.debug(this.params)
            this.next()
        ]

    $routeProvider
    .when '/',
        templateUrl : 'pages/users.html'
        controller  : 'userCtrl'
    .when '/page',
        templateUrl : 'pages/page.html'
        controller  : 'pageCtrl'
        middleware: 'log'
    .when '/upload',
        templateUrl : 'pages/upload.html'
        controller  : 'uploadCtrl'
    .when '/fb',
        templateUrl : 'pages/fb.html'
        controller  : 'fbCtrl'
    .otherwise
        redirectTo: '/' 

    $locationProvider.hashPrefix('')
