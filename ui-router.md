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
                    
