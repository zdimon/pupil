##Firebase


##Get registered

https://console.firebase.google.com
https://firebase.google.com/pricing/



###Installing

    https://github.com/firebase/angularfire

    <script src="https://www.gstatic.com/firebasejs/3.6.7/firebase.js"></script>
    <script src="https://cdn.firebase.com/libs/angularfire/2.3.0/angularfire.min.js"></script>
    

##Add to app
    
    app = angular.module(..., [...,"firebase"]);
    

##Scafold

### Route

    .when '/fb',
    templateUrl : 'pages/fb.html'
    controller  : 'fbCtrl'

### Controller

    .controller 'fbCtrl', [
        '$scope',
        ($scope)->
             $scope.log = [
                            {id: 1, title: 'test', time: '12-00'},
                            {id: 1, title: 'test', time: '12-00'},
                           ]
        ]    
    
###Template

    h1 Firebase

    TABLE.table
        thead
            tr
                th #
                th Заголовок
                th Действия
        tbody
            tr(ng-repeat="l in log")
                td
                    {{ l.id }}
                td
                    {{ l.title }}
                td
                    {{ l.time }}
                        
                        
                        
###Configurate firebase

                            
        config =
            apiKey: 'AIzaSyBo4BEA7jAy7bGdKjjgrOYl9Ug6kVFy77E'
            authDomain: 'firstprj-2238d.firebaseapp.com'
            databaseURL: 'https://firstprj-2238d.firebaseio.com/'

        firebase.initializeApp config
                        
###Get data

        ref = firebase.database().ref()
        $scope.data = $firebaseObject(ref)
        
    
##Create an object


        ref = firebase.database().ref().child("log")
        syncObject = $firebaseObject(ref);
        syncObject.$bindTo($scope, "log");
        $scope.add = ()->
            $scope.log = {id: 1, title: 'test', time: '12-00'})    
            
##Manipulate an array using $firebaseArray

        ref = firebase.database().ref().child("log")
        $scope.log = $firebaseArray(ref);
        $scope.add = ()->
            $scope.log.$add {id: 1, title: 'test', time: '12-00'}
            

##Removing

    $scope.remove = (id)->
    $scope.log.$remove $scope.log.$getRecord(id)            
            
    a(ng-click="remove(l.$id)") Delete       
            
##Editing

    a(ng-click="edit(l.$id,key)") Edit

    $scope.edit = (id,key)->
        r = $scope.log.$getRecord(id)
        r.title = $scope.log[key].title
        $scope.log.$save(r)                
            
            
##Watching

        $scope.$watch 'log', ()->
            angular.forEach $scope.log, (v,k)->
                r = $scope.log.$getRecord(v.$id)
                r.title = $scope.log[k].title
                $scope.log.$save(r)
                console.log k
        , true
                    
            
            
https://www.firebase.com/docs/web/libraries/angular/api.html

            
                        