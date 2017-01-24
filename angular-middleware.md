##Angular midleware

    npm install --save angular-middleware

    script(src="node_modules/angular-middleware/dist/angular-middleware.min.js")

    angular.module('pupilApp', ['ngRoute', 'ngRoute.middleware'])
    .config ($routeProvider,$locationProvider, $middlewareProvider)->

        $middlewareProvider
        .map 
            'log': [ '$log', ($log)->
                $log.debug(this.params)
                this.next()
            ]


