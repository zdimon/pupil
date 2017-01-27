#File upload

https://github.com/nervgh/angular-file-upload

    npm install angular-file-upload

    script(src="node_modules/angular-file-upload/dist/angular-file-upload.min.js")


##Routing

    .when '/upload',
        templateUrl : 'pages/upload.html'
        controller  : 'uploadCtrl'

##Link

    li
        a(href="#/upload") Upload file



##Controller
    
    .controller 'uploadCtrl', [
        '$scope', 'FileUploader',
        ($scope, FileUploader)->
             $scope.uploader = new FileUploader()
        ]    

##Template


    h1 upload
    form
        input(type="file" nv-file-select uploader="uploader")

        ul
            li(ng-repeat="item in uploader.queue") Name:
                span(ng-bind="item.file.name")
                button(ng-click="item.upload()") upload

##Node dependencie

https://www.npmjs.com/package/multer

    npm install --save multer

    multer  = require 'multer'

##Setting   

    multer  = require 'multer'
    upload = multer
        dest: 'uploads/'

##Node routing 

    router.post '/upload', upload.any(), (req, res, next)->
        res.json {'message': 'ok'}

##Handle file

    storage = multer.diskStorage
        destination: './uploads'
        filename: (req, file, cb)->
            cb null, (Math.random().toString(36)+'00000000000000000').slice(2, 10) + Date.now() + path.extname(file.originalname)
    .....

    multer  = require 'multer'
    upload = multer
        dest: 'uploads/'
        storage: storage


