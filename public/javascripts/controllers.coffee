angular.module('chatApp')
.controller 'chatCtrl', [
    '$scope', 'mySocket', ($scope, mySocket)->



]

.controller 'onlineCtrl', [
    '$scope', 'mySocket', ($scope, mySocket)->

        $scope.users_online = {}

        mySocket.on 'someone_left',  (data)->
            delete $scope.users_online[data.user_id]
            console.log 'left '+ data.user_id

        mySocket.on 'someone_joined',  (data)->
            $scope.users_online[data.user_id] = data.user_id
            console.log 'join '+ data.user_id
]
