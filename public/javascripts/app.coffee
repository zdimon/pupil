angular.module('testApp', ['ui.router'])
.controller 'testCtrl', [
    '$scope', '$state', ($scope, $state)->
        $scope.message = 'Hello from Angular'
        $scope.activate_contact = ()->
            $state.go('contacts')
]
.config ($stateProvider, $urlRouterProvider)->
    $stateProvider
    .state 'contacts',
        templateUrl: 'templates/contacts.html'
        url: '/contact'
        controller: ($scope)->
            $scope.contacts = [
                'Dima'
                'Vova'
                'Roma'
            ]
    .state 'messages',
        template: '<h1>My Messages</h1>'
        url: '/message'
    .state 'message',
        url: '/message/:name'
        templateUrl: ($stateParams)->
            return 'templates/messages-of-' + $stateParams.name + '.html'
        controller: ($scope, $stateParams)->
            $scope.name = $stateParams.name
