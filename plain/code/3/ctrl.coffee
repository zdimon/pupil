angular.module myApp, []
.controller 'myCtrl', ($scope)->
    $scope.contacts = ['Dima', 'Vova']
    $scope.add = ()-> $scope.contacts.push($scope.newcontact)
        
