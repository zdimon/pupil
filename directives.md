#Directives

    h1 {{ message }}
    ul
     li(ng-repeat="i in images")
        myimg
            
            

    .directive 'my-img', ()->
        restrict: 'E'
        template: '<h1> My image </h1>'                        
        
        
        
## Restrict

A - attribute

E - element        

C - class

    replace: true
    
##Child scope 

    .controller 'testCtrl', [
        '$scope', ($scope)->
            $scope.message = 'Hello from Angular'

    template: '<h1> {{ message }} </h1>'
    
##Isolate scope

    scope:
        myvar: '@name'
    controller: ($scope)->
        console.log $scope.myvar
        
    #template
    
    li(ng-repeat="i in images")
       myImg( name="{{i.name}}" )      
       
       
##ng-model

    .directive 'glink', ()->
        restrict: 'E'
        #replace: true
        scope:
            url: '@'
            text: '@'
        template: '<input type="text" ng-model="url"> <a href="{{ url }}">{{ text }}</a>'
        
        
     glink(url="http://google.com" text="Click to go to Google")   
             
    
    
    