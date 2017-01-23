
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
