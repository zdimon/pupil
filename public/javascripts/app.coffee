angular.module('testApp', [])
.controller 'testCtrl', [
    '$scope', ($scope)->
        $scope.message = 'Hello from Angular'
]
