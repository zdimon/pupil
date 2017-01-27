
angular
.module('pupilApp')
.controller 'userCtrl', [
    '$scope'
    'Model'
    ($scope, Model)->

        console.log('userCtrl')

        refreshUsers = ()->
            Model.get_user_list().then (d)->
                $scope.users =  d.data

        $scope.remove = (id)->
            console.log(id)
            Model.remove id,()->
                refreshUsers()


        $scope.edit = (id)->
            $scope.user = $scope.users[id]
            $scope.user.is_edit = true


        $scope.save = ()->
            console.log('saving');
            Model.save $scope.user, ()->
                refreshUsers()

            $scope.user = {};




        refreshUsers()


]

.controller 'pageCtrl', [
    '$scope'
    'Page'
    '$location'
    ($scope, Page, $location)->
        #$location.path('/').replace()
        update_list = ()->
            Page.list (r)->
                $scope.pages = r.data
        update_list()
    ]



.controller 'loginCtrl', [
    '$scope'
    'LoginService'
    ($scope, LoginService)->
        $scope.login = ()->
            #console.log LoginFactory
            LoginService.login $scope.username, $scope.password, (rez)->
                $scope.message = rez.data

                if not $scope.message.success
                    console.log $scope.message
                    $scope.is_error = true
                    $scope.error_message = $scope.message.message
                else
                    $scope.is_authenticated = true

    ]

.factory 'LoginFactory', ($http)->
    login = (login,password,callback)->
        data = {name: login, password: password}
        $http.post('/login', data).then callback
    return {login: login}


.service 'LoginService', [ '$http', class Login
        constructor: (@$http)->
        login: (login,password,callback)->
            data = {name: login, password: password}
            @$http.post('/login', data).then callback
    ]


.controller 'uploadCtrl', [
    '$scope', 'FileUploader',
    ($scope, FileUploader)->
         $scope.uploader = new FileUploader()
    ]


.controller 'fbCtrl', [
    '$scope', '$firebaseObject', '$firebaseArray',
    ($scope, $firebaseObject, $firebaseArray)->

        config =
            apiKey: 'AIzaSyBo4BEA7jAy7bGdKjjgrOYl9Ug6kVFy77E'
            authDomain: 'firstprj-2238d.firebaseapp.com'
            databaseURL: 'https://firstprj-2238d.firebaseio.com/'

        firebase.initializeApp config

        ref = firebase.database().ref()
        $scope.data = $firebaseArray(ref)

        ref = firebase.database().ref().child("log")
        $scope.log = $firebaseArray(ref);
        #syncObject.$bindTo($scope, "log");
        console.log $scope.log
        $scope.add = ()->
            $scope.log.$add
                title: $scope.title
                time: $scope.time
        $scope.remove = (id)->
            $scope.log.$remove $scope.log.$getRecord(id)
        $scope.remove_all = (id)->
            firebase.database().ref().child("log").remove()
        $scope.edit = (id,key)->
            r = $scope.log.$getRecord(id)
            r.title = $scope.log[key].title
            $scope.log.$save(r)

        $scope.$watch 'log', ()->
            angular.forEach $scope.log, (v,k)->
                r = $scope.log.$getRecord(v.$id)
                r.title = $scope.log[k].title
                $scope.log.$save(r)
                console.log k
        , true


        ###
        $scope.log = [
                        {id: 1, title: 'test', time: '12-00'},
                        {id: 1, title: 'test', time: '12-00'},
                       ]
        ###
    ]
