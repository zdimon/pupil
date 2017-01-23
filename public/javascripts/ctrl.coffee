
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





