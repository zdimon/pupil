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
        template: '<h1>My Contacts</h1>'
        url: '/contact'
    .state 'messages',
        template: '<h1>My Messages</h1>'
        url: '/message'
