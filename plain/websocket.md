##Web socket

###Installation 

    npm install socket.io angular-socket-io --save

###Add scripts

    script(src="node_modules/socket.io/node_modules/socket.io-client/dist/socket.io.min.js")
    script(src="node_modules/angular-socket-io/socket.min.js")    

###inject dependencies

    app = angular.module('myapp',[
    'btford.socket-io'


###Simple factory

    angular.module('chatApp')
    .factory 'mySocket', (socketFactory)->
        socketFactory()


###Simple controller

    angular.module('chatApp')
    .controller 'chatCtrl', [
        '$scope', 'mySocket', ($scope, mySocket)->
    ]

###Create a socket server

    module.exports = (io)->
        io.on 'connection', (client)->
            console.log('Client connected...')


###Include it in www.coffee

    server = http.createServer app

    io = require('socket.io')(server);
    sock = require('../sock')(io);

###Simple timer


    setInterval ()->
        time = new Date()
        io.emit('time', {time: time});
        console.log "just have sent #{time}"
    ,5000

###Simple reaction  in concroller

        mySocket.on 'time',  (data)->
            console.log data

###As well as in run function.

    .run [ 'mySocket', (mySocket)->
        mySocket.on 'time',  (data)->
            console.log data
    ]

###Subscribing on an event

    io.on 'connection', (client)->
        console.log('Client connected...')

        client.on 'join', (data)->
            console.log database

###Trigger the event

    mySocket.emit('join',{user_id: '123'});

###Add uuid

    npm install --save angular-uuid

###Add script

    script(src="node_modules/angular-uuid/angular-uuid.js")

###Using

    angular.module('chatApp', [... 'angular-uuid'])
    ...
    mySocket.emit('join',{user_id:  uuid.v4()});

###Creating socket's collection

    sockets = {}
    .....
        client.on 'join', (data)->
            sockets[data.user_id] = client
            console.log socketserver

###Advancing disconection and conection events

        client.on 'join', (data)->
            sockets[data.user_id] = client
            io.emit('someone_joined', {user_id: data.user_id, act: 'someone_joined'});

        client.on 'disconnection', (data)->
            delete sockets[data.user_id]
            io.emit('someone_left', {user_id: data.user_id, act: 'someone_left'});

###Fire disconection from angular

    $window.onunload = ()->
        mySocket.emit('disconnection',{message: 'disconect', user_id:  user_id})

###Create user online controller

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

###Template

        h2 User online
        ul
            li(ng-repeat="u in users_online")
                {{ u }}

###Pass all list of users online


    users_online = []

    io.on 'connection', (client)->
        

        client.on 'join', (data)->
            ..
            users_online.push(data.user_id)
            io.emit('someone_joined', {user_id: data.user_id, act: 'someone_joined', users_online: users_online});

        client.on 'disconnection', (data)->
            ..
            index = users_online.indexOf data.user_id # <-- Not supported in <IE9
            if index != -1
                users_online.splice(index, 1)

##Change controller

        mySocket.on 'someone_left',  (data)->
            $scope.users_online = data.users_online
            

        mySocket.on 'someone_joined',  (data)->
            $scope.users_online = data.users_online
               

##Higlight current user

    button(class="btn btn-danger") {{ current_user_id }}

    .run
    ...
        $rootScope.current_user_id = user_id


##Remove current user from user onlineCtrl
    
    li(ng-repeat="u in users_online" ng-show="u!=current_user_id")

##Add open chat box function

    $scope.open_chat = (user_id)->
        $scope.$emit 'open_room', {user_id: user_id}
    
##Catch event from chatCtrl

        $scope.active_rooms = []
        $rootScope.$on 'open_room', (event,data)->

            room =
                messages:
                    ['Robot': 'User start chat']
                is_new_message: true
                opponent: data.user_id.substring 1,6
                participants:
                    [$rootScope.current_user_id,data.user_id]

            $scope.active_rooms.push room
            $scope.current_room = room


##Show rooms in templates

    div( ng-repeat="room in active_rooms" class="well")
        h3 {{room.opponent}}
        ul
            li(ng-repeat="m in room.messages")
                {{ m }}
    input(ng-model="message")
    button(class="btn btn-success" ng-click="send()") Send


##Send messages


        $scope.send = ()->
            angular.forEach $scope.current_room.participants, (v,k)->
                mySocket.emit('send_message',{message: $scope.message, to_user_id:  v, from_user_id: $rootScope.current_user_id})
            $scope.message = ''


##Get message in server and send it to destination.

        client.on 'send_message', (data)->
            sockets[data.to_user_id].emit('take_message',{message: data.message})



