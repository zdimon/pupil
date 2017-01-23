##Modal window

    npm install angular-ui-bootstrap --save

###Modal window in state

    .state 'modal',
        url: '/modal'
        onEnter: [
            '$stateParams'
            '$state' 
            '$uibModal' 
            ($stateParams, $state, $uibModal)-> 
                $uibModal.open
                    templateUrl: "templates/modal.html"
                    resolve: 
                        items: ()->
                            [1,2,3]
                    
                    controller: [
                        '$scope', 
                        'items', 
                        ($scope, items) ->
                            $scope.dismiss = () ->
                                $scope.$dismiss()
                        ]
                .result.finally ()->
                        $state.go('admin.home')
         
         ] 
