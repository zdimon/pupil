##Angular ui-router

https://github.com/angular-ui/ui-router/wiki/
https://github.com/angular-ui/ui-router/wiki/Quick-Reference#ui-sref

    npm install --save angular-ui-router 

###Add script

    script(src="node_modules/angular-ui-router/release/angular-ui-router.min.js")

###Add directive

    section(ui-view)


Patterns.

    angular.module("myApp", ["ui.router"]).config(function($stateProvider){
        $stateProvider.state(stateName, stateConfig);
    })

    $stateProvider.state("home", {}).state("about", {}).state("contacts", {});


The stateConfig object has the following acceptable properties.

##Templating.

**template** String HTML content, or function that returns an HTML string

**templateUrl** String URL path to template file OR Function, returns URL path string

**templateProvider** Function, returns HTML content string

Example.

    .config ($stateProvider, $urlRouterProvider)->
        $stateProvider
        .state 'contacts',
            template: '<h1>My Contacts</h1>'
            url: '/contact'
        .state 'messages',
            template: '<h1>My Messages</h1>'
            url: '/message'


##Navigation.

$state.go() - High-level convenience method.
ui-sref directive
Navigate to the url associated with the state.

###Note: $location.path('/').replace() - does not work!!!
This service parses the url.


$location.path() - return current path.


$location.path('/') - change the path.

##locationProvider

    $locationProvider.html5Mode(true) - HTML5 mode
       
    $locationProvider.hashPrefix('') - remove !

##Default path.    

    $urlRouterProvider.when('', '/');

    $urlRouterProvider.otherwise('/404');

    doctype html
    html
        head
            title= title
            link(rel='stylesheet', href='/stylesheets/style.css')
            link(rel='stylesheet', href='node_modules/bootstrap/dist/css/bootstrap.min.css')
            script(src="node_modules/jquery/dist/jquery.min.js")
            script(src="node_modules/bootstrap/dist/js/bootstrap.min.js")
            script(src="node_modules/angular/angular.min.js")
            script(src="node_modules/angular-ui-router/release/angular-ui-router.min.js")




        body(ng-app="testApp")
            nav(class="navbar navbar-inverse navbar-fixed-top")
                div(class="container")
                    div(class="navbar-header")
                        a(href="#" class="navbar-brand") Project
                    div(class="collapse navbar-collapse")
                        ul(class="nav navbar-nav")
                            li
                                a(ui-sref="contacts" href="#") Contacts
                            li
                                a(ui-sref="messages" href="#") Messages

            div(style="padding-top: 60px" ng-controller="testCtrl")
                h1 {{ message }}
                a(href="#" ui-sref="message({name: 'dima'})") Contact of Dima
                section(ui-view)
            script(src="javascripts/app.js")
        
##Activate state inside controller.        
        
        $scope.activate_contact = ()->
            $state.go('contacts')        
        
        
##Manipulating with $stateParams       

        templateUrl: ($stateParams)->
            return 'templates/messages-of-' + $stateParams.name + '.html'
             


##Controller 

        controller: ($scope)->
            $scope.contacts = [
                'Dima'
                'Vova'
                'Roma'
            ]
            
##Resolve

You can use resolve to provide your controller with content or data that is custom to the state. 
Resolve is an optional map of dependencies which should be injected into the controller.


    /////js
    resolve: {
    
             messages:  function($http){
            return $http({method: 'GET', url: '/messages'}).then(function(res){ return {messages: res.data} });
         }

    
    }
    /////coffee
    resolve:
        messages:  ($http)->
            return $http
                method: 'GET'
                url: '/get_messages'    
            .then (res)->
                messages = res.data
                

##Pass to the controller

        controller: ($scope, $stateParams, messages)->
            $scope.messages = messages

            

##Attach Custom Data to State Objects

    data: {
        customData: 5,
    } 
    
Retreaving

    $state.current.data.customData1


##onEnter and onExit callbacks

    onEnter: function(messages){
        console.log('enter - '+messages);
      },
  

    onEnter: (messages)->
       console.log "enter - #{messages}"

There are also optional 'onEnter' and 'onExit' callbacks that get called when a state becomes active and inactive respectively. 
The callbacks also have access to all the resolved dependencies.

##Routing events

**$stateChangeStart ($routeChangeStart)** - before url changing


**$stateChangeSuccess** - after changing

**$stateChangeError**

    
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
                 
## Nesteed states and views

    .state 'admin',
        templateUrl: 'templates/admin.html'

    .state 'admin.users',
        url: '/admin/users'
        templateUrl: 'templates/admin-users.html'
        
        
    .state 'admin',
        templateUrl: 'templates/admin.html'

or

    .state 'users',
        url: '/admin/users'
        parent: 'admin'
        templateUrl: 'templates/admin-users.html'        
        
##Views

    ---admin.html    
    
    <h1> Admin </h2>
    <div ui-view></div>
    
    
    ---admin-users.html
    
    <h2> Admin users </h2>

    <ul>
        <li ng-repeat="u in users">{{u.name}}</li>
    </ul>


    <h2> Admin messages </h2>

    <ul>
        <li ng-repeat="m in messages">{{m.text}}</li>
    </ul>
    
    
    
##Controllers

    .state 'admin',
        templateUrl: 'templates/admin.html'
        controller: ($scope)->
            $scope.messages = [
                text: 'one'
                text: 'two'
                text: 'tree'
            ]
    .state 'users',
        url: '/admin/users'
        parent: 'admin'
        templateUrl: 'templates/admin-users.html'
        controller: ($scope)->
            $scope.users = [
                name: 'wezom'
            ]    
        
        
##Child states will inherit **resolved** dependencies and **data** from parent state        

##Parameters

    .state 'detail',
        url: '/user/detail/:id'
        parent: 'admin'
        templateUrl: 'templates/admin-users-detail.html'
        controller: ($scope, $stateParams)->
            $scope.user_id = $stateParams.id
            
Template

    <a ui-sref="detail({id: 23})"> Detail </a>    
    
Indicate active view.

    <li ui-sref-active="active">
        <a ui-sref="posts.details">Posts</a>
    </li>       
                        

##Multiviews

    .state 'admin',
        url: '/'
        templateUrl: 'templates/admin.html'
    .state 'admin.home',
        url: 'home'
        templateUrl: 'templates/admin-home.html'               
    .state 'admin.users',
        url: 'users'
        templateUrl: 'templates/admin-users.html'            
    .state 'admin.messages',
        url: 'messages'
        templateUrl: 'templates/admin-messages.html'        
    .state 'admin.404',
        url: '404'
        templateUrl: 'templates/404.html'


    # admin.html
    



    <h1> Admin index template </h2>


            <nav class="navbar navbar-default">
             <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                  <li ui-sref-active="active"><a ui-sref="admin.home" href="#">Home</a></li>
                  <li ui-sref-active="active"><a ui-sref="admin.users">Users</a></li>
                  <li ui-sref-active="active"><a ui-sref="admin.messages">Messages</a></li>
                </ul>
              </div><!--/.nav-collapse -->
            </nav>  


    <div class="well">
        <div ui-view></div>
    </div>


Absolute path.


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


    ##inner template

    <h1> Admin home </h2>


     <div ui-view="footer-inside"></div>


