angular.module('scopeApp',[])
.controller('FirstController',($scope, $rootScope)->
    $scope.setmyname = ()->
        $scope.myname = 'Dima'
    $scope.setglobalname = ()->
        $rootScope.globalname = 'WORLD'
)
.controller('SecondController',($scope)->
    $scope.sethisname = ()->
        $scope.hisname = 'VOVA PUTIN'
)
