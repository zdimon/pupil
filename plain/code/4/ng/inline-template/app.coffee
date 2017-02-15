app = angular.module('articleApp',['ngRoute'])
.config(($routeProvider)->
    $routeProvider
    .when('/', {
                templateUrl : 'list.html',
                controller  : 'testCtrl'
    })
)
.controller 'testCtrl', ['$scope', ($scope)->      
        $scope.message = 'Hello World!!!'
        $scope.items = [{'name': 'Dima'}, {'name': 'Vova'}]
    ]
