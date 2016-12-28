app.controller('userCtrl',['$scope', 'Model', function($scope, Model){

    console.log('userCtrl');

/*
     Model.get_user_list(function(rezult){
        $scope.users = rezult.data;
        console.log($scope.users);
    });

*/
    function refreshUsers(){
        Model.get_user_list().then(function(d){
                $scope.users =  d;
        });
    };

    $scope.remove = function(id){
        console.log(id);
        Model.remove(id,function(){
            refreshUsers();
        });
    };


    $scope.edit = function(id){
        $scope.user = $scope.users[id];
        $scope.user.is_edit = true;
        
    };

    $scope.save = function(){
        console.log('saving');
        Model.save($scope.user,function(){
            refreshUsers();
        });
        console.log($scope.user);
        $scope.user = {};

        console.log($scope.users);

    };
    refreshUsers();
    //$scope.$evalAsync(function() { $('#data').datepicker({}); } );

}])
