##Controller inheritance

    app = angular.module('myApp',[])

    .controller('baseCtrl',function($scope){
        
        $scope.myvar = 'Hello';
        $scope.sayhello = function(){
            console.log($scope.myvar);
        };

       
    })

    .controller('testCtrl',function($scope,$controller){
        var vm = this;
        angular.extend(vm, $controller('baseCtrl', {$scope: $scope}));

    })



