angular.module('testApp', ['ui.router'])
.controller 'testCtrl', [
    '$scope', '$state', '$location', ($scope, $state, $location)->
        $scope.message = 'Hello from Angular'
        $scope.activate_contact = ()->
            $state.go('contacts')

        $scope.to_home = ()->
            $location.path('/').replace()


]
.config ($stateProvider, $urlRouterProvider, $locationProvider)->
    $stateProvider
    .state 'admin',
        url: '/admin'
        templateUrl: 'templates/admin.html'
        controller: ($scope)->
            $scope.messages = [
                { text: 'one' }
                { text: 'two' }
                { text: 'tree' }
            ]
    .state 'users',
        url: '/users'
        parent: 'admin'
        templateUrl: 'templates/admin-users.html'
        controller: ($scope)->
            $scope.users = [
                name: 'wezom'
            ]
    .state 'detail',
        url: '/user/detail/:id'
        parent: 'admin'
        templateUrl: 'templates/admin-users-detail.html'
        controller: ($scope, $stateParams)->
            $scope.user_id = $stateParams.id

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
        resolve:
            messages:  ($http)->
                $http
                    method: 'GET'
                    url: '/get_messages'
                .then (res)->
                    messages = res.data
        data:
            customData: 'one'
        onEnter: isAuth
        url: '/message/:name'
        templateUrl: ($stateParams)->
            return 'templates/messages-of-' + $stateParams.name + '.html'
        controller: ($scope, $stateParams, $state, messages)->
            $scope.name = $stateParams.name
            $scope.messages = messages
            console.log $state.current.data.customData
        views:
            '':
                template: '<h1> Messages </h1>'
            myw:
                controller: ()->
                    console.log 'view 1'
                template: '<h1> My template </h1>'

    isAuth = ($http)->
        $http
            method: 'GET'
            url: '/is_auth'
        .then (res)->
            console.log res.data



    $locationProvider.html5Mode(false)
    $locationProvider.hashPrefix('')

.run [
        '$rootScope'
        ($rootScope)->
            $rootScope.$on '$stateChangeStart', (evt,next,current)->
                console.log "from #{current.url} to #{next.url}"
                console.dir current


            $rootScope.$on '$stateChangeSuccess', (evt,next,current)->
                console.log "from #{current.url} to #{next.url}"
                console.dir evt
]
