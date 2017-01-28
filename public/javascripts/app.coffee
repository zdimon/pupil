angular.module('chatApp', ['ui.router', 'btford.socket-io', 'angular-uuid'])

.config ($stateProvider, $urlRouterProvider, $locationProvider)->
    $stateProvider
    .state 'chat',
        url: '/'
        templateUrl: 'chat.html'

    .state 'chat.index',
        url: 'index'
        views:
            '':
                templateUrl: 'chat-index.html'
                controller: 'chatCtrl'
            'user-online':
                templateUrl: 'chat-user-online.html'
                controller: 'onlineCtrl'


    .state 'chat.history',
        url: 'users'
        templateUrl: 'chat-history.html'

    .state 'chat.404',
        url: '404'
        templateUrl: '404.html'

    $urlRouterProvider.when('', '/index');
    $urlRouterProvider.otherwise('/404');

    $locationProvider.html5Mode(false)
    $locationProvider.hashPrefix('')

.run [ 'mySocket', 'uuid', '$window', '$rootScope', (mySocket,uuid, $window, $rootScope)->
    user_id = uuid.v4()

    #$rootScope.$on '$destroy', ()->
    #    mySocket.emit('disconect',{message: 'disconetc', user_id:  user_id});

    ###
    mySocket.on 'someone_left',  (data)->
        console.log data

    mySocket.on 'someone_joined',  (data)->
        console.log data
    ###
    $window.onunload = ()->
        mySocket.emit('disconnection',{message: 'disconect', user_id:  user_id})


    #console.dir mySocket

    mySocket.emit('join',{user_id: user_id })
    $rootScope.current_user_id = user_id
]
