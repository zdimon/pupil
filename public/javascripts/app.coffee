angular.module('chatApp', ['ui.router'])
.controller 'chatCtrl', [
    '$scope', '$state', '$location', ($scope, $state, $location)->

]
.config ($stateProvider, $urlRouterProvider, $locationProvider)->
    $stateProvider
    .state 'chat',
        url: '/'
        templateUrl: 'templates/chat.html'

    .state 'chat.index',
        url: 'index'
        views:
            '':
                templateUrl: 'templates/chat-index.html'
            'user-online':
                templateUrl: 'templates/chat-user-online.html'


    .state 'chat.history',
        url: 'users'
        templateUrl: 'templates/chat-history.html'

    .state 'chat.404',
        url: '404'
        templateUrl: 'templates/404.html'

    $urlRouterProvider.when('', '/index');
    $urlRouterProvider.otherwise('/404');

    $locationProvider.html5Mode(false)
    $locationProvider.hashPrefix('')
