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
.controller('contactController', ($scope,$http)->       
    $scope.content = 'Tell me something';
    $http.get('/contacts').success((result)->
        $scope.contacts = result
        console.log $scope.contacts
    )

)
.run(($rootScope, $location)->
    $rootScope.isActive = (viewlocation)->
        return viewlocation == $location.path()    
)
