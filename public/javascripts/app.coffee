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
            'user-online':
                templateUrl: 'chat-user-online.html'


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

.run [ 'mySocket', 'uuid', '$rootScope', (mySocket,uuid, $rootScope)->
    user_id = uuid.v4()

    #$rootScope.$on '$destroy', ()->
    #    mySocket.emit('disconect',{message: 'disconetc', user_id:  user_id});

    mySocket.on 'time',  (data)->
        console.log data

    mySocket.emit('join',{user_id: user_id });

]
