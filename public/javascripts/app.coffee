angular.module('chatApp', ['ui.router'])
.controller 'chatCtrl', [
    '$scope', '$state', '$location', ($scope, $state, $location)->

]
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
