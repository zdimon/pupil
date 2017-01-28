angular.module('chatApp')
.factory 'mySocket', (socketFactory)->
    mySocket = socketFactory
        disconnect: (close)->
            alert 'ddd'
          
    return mySocket
