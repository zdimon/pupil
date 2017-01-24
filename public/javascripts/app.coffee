angular.module('pupilApp', ['ngRoute', 'ngRoute.middleware'])
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
    .otherwise
        redirectTo: '/'

    $locationProvider.hashPrefix('')
