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
        url: '/'
        views:              
            '':            
                templateUrl: 'templates/admin.html'    
            'footer-outside@admin':
                template: '<div class="col-md-12 well">Outside footer Copyright @wezom@</div>'                   
                                                
    .state 'admin.home',
        url: 'home'
        views:
            'menu':
                template: '<h3>Home menu</h3>'    
            '':            
                templateUrl: 'templates/admin-home.html'                   
            'footer-inside@admin.home':
                template: '<div class="col-md-12 well">Inside footer Copyright @wezom@</div>'    

    .state 'admin.users',
        url: 'users' 
        views:
            'menu':
                template: '<h3>User menu</h3>'    
            '':            
                templateUrl: 'templates/admin-users.html'  
    .state 'admin.messages',
        url: 'messages'
        views:
            'menu':
                template: '<h3>Message menu</h3>'    
            '':            
                templateUrl: 'templates/admin-messages.html' 

    .state 'admin.404',
        url: '404'
        templateUrl: 'templates/404.html'

    $urlRouterProvider.when('', '/home');
    $urlRouterProvider.otherwise('/404');

    $locationProvider.html5Mode(false)
    $locationProvider.hashPrefix('')

