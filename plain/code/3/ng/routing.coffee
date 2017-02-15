angular.module('routingApp',['ngRoute'])
.config(($routeProvider)->
    $routeProvider
    # route for the home page
    .when('/', {
                templateUrl : 'pages/home.html',
                controller  : 'mainController'
    })
    .when('/contact', {
                templateUrl : 'pages/contact.html',
                controller  : 'contactController'
    })
    .when('/about', {
                templateUrl : 'pages/about.html',
                controller  : 'aboutController'
    })

)
.controller('mainController', ($scope)->       
    $scope.content = 'Everyone come and see how good I look!';
)
.controller('aboutController', ($scope)->       
    $scope.content = 'I am nice!';
)
.controller('contactController', ($scope)->       
    $scope.content = 'Tell me something';
)
.run(($rootScope, $location)->
    $rootScope.isActive = (viewlocation)->
        return viewlocation == $location.path()    
)
