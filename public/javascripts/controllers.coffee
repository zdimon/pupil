angular.module('chatApp')
.controller 'chatCtrl', [
    '$scope', 'mySocket', '$rootScope', ($scope, mySocket, $rootScope)->
        $scope.active_rooms = []
        $scope.$on 'open_room', (event,data)->

            room =
                messages:
                    ['Robot': 'User start chat']
                is_new_message: true
                opponent: data.user_id.substring 1,6
                participants:
                    [$rootScope.current_user_id,data.user_id]

            $scope.active_rooms.push room
            $scope.current_room = room

        $scope.send = ()->
            angular.forEach $scope.current_room.participants, (v,k)->
                mySocket.emit('send_message',{message: $scope.message, to_user_id:  v, from_user_id: $rootScope.current_user_id})
            $scope.message = ''


        mySocket.on 'take_message', (data)->
            console.log data
            $scope.current_room.messages.push({message: data.message})

]

.controller 'onlineCtrl', [
    '$scope', 'mySocket', '$rootScope', ($scope, mySocket, $rootScope)->

        $scope.users_online = {}

        mySocket.on 'someone_left',  (data)->
            $scope.users_online = data.users_online
            console.log 'left '+ data.user_id

        mySocket.on 'someone_joined',  (data)->
            $scope.users_online = data.users_online
            console.dir data.users_online



        $scope.open_chat = (user_id)->
            $rootScope.$broadcast 'open_room', {user_id: user_id}



]
