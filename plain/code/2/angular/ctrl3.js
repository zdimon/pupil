angular.module('myApp',[])
.controller('myController',function($scope){

	    $scope.contacts = [
            {
                'id': 1,
                'name': 'Dima',
                'email': 'zdimon77@gmail.com'
            },
            {
                'id': 2,
                'name': 'Vova',
                'email': 'vova@gmail.com'
            }
        ];

	    $scope.add = function() {
            item = {
                'id': $scope.contacts.length+1,
                'name': $scope.name,
                'email': $scope.email             
                }
            $scope.name = '';
            $scope.email = '';
		    $scope.contacts.push(item);
        };

         $scope.del = function(id) {
            
            for(var i=0;i<$scope.contacts.length;i++){
                
                if ($scope.contacts[i].id == id) {
                    console.log($scope.contacts[i]);
                    //delete $scope.contacts[i];
                    $scope.contacts.splice(i,1);  
                }
            }
            console.log($scope.contacts);
            
         };

});


