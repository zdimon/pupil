angular.module('chatApp')
.factory 'mySocket', [ 'socketFactory', '$rootScope', (socketFactory, $rootScope)->
    sock = socketFactory()

    sock
]
