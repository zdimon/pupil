#User list

##Install requirements.
    
<<<<<<< HEAD
    npm install angular bootstrap bootstrap-datepicker --save
=======
    npm install angular bootstrap bootstrap-datepicker open --save
    
##Open browser    
    
    var open = require('open');
    open('http://localhost:3000');   
>>>>>>> userlist

##Add scripts

    link(rel='stylesheet', href='/stylesheets/style.css')
    link(rel='stylesheet', href='node_modules/bootstrap/dist/css/bootstrap.min.css')
    script(src="node_modules/jquery/dist/jquery.min.js")
    script(src="node_modules/bootstrap/dist/js/bootstrap.min.js")
    script(src="node_modules/angular/angular.min.js")
    script(src="node_modules/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js")    
    
##Create a simink.

    ln -s to from
    

##Add a navigation bar

    nav(class="navbar navbar-inverse navbar-fixed-top")
        div(class="container")
            div(class="navbar-header")
                a(href="#" class="navbar-brand") Project
            div(class="collapse navbar-collapse")
                ul(class="nav navbar-nav")
                    li
                        a(href="#") Home
                    li
                        a(href="#") Pages
                        
##Add content block and application and controllers application`s scripts.

        div(style="padding-top: 60px")
            block content
        script(src="javascripts/app.js")
        script(src="javascripts/ctrl.js")
        script(src="javascripts/model.js")
                                
                                
##Define an empty application in app.js.

    // app.js
    var app = angular.module('pupilApp', [])
    
##Define simple controllers sctipt.

    //--ctrl.js
    
    app.controller('userCtrl',['$scope', function($scope){

        console.log('userCtrl');    
    
    }
    
## Define internal template (index.jade).


extends layout

    block content
        div(ng-controller="userCtrl")
            div.well
                h1 Пользователи

                table.table
                    thead
                        tr
                            th #
                            th Логин
                            
                    tbody
                        tr(ng-repeat="u in users"  ng-click="edit(u.id)")
                            th {{ u.id }}
                            td {{ u.name }}
                            
##Put test data in controller.

    $scope.users = {1: {id: 1, name: 'Sergey'}, 1: {id: 2, name: 'Dima'}};
    
    
##Create a simple model in model.js.


    (function () {
      'use strict';

      angular
        .module('pupilApp')
        .factory('Model', Model);


      function Model() {

            var Model = {
              get_user_list: get_user_list,
            };

            return Model;

        

            function get_user_list() {
               return {1: {id: 1, name: 'Sergey'}, 1: {id: 2, name: 'Dima'}}
            };

       

      };



    })();

###Add this model into the page.

    script(src="javascripts/model.js")
    
###Add the model into controller.

    app.controller('userCtrl',['$scope', 'Model', function($scope, Model){
    
    .....
    
###Create a function to refresh user list.

    function refreshUsers(){
    
        $scope.users = Model.get_user_list();
    
    };
    
##Rewrite the model using http request.



Inject dependence.

    ....

    Model.$inject = ['$http'];

    function Model($http) {    
    
    ....               
   
      
    function get_user_list(callback) {
      var url = 'users.json'
      return $http.get(url).success(callback); 
    };          
         
        
Call this function from the controller.

    
         Model.get_user_list(function(result){ 
            $scope.users = result;
         });
                   

Create users.json file in public directory.
                      
                      
Rewrite the function terurning the promise.    
    
        function get_user_list() {
          var url = 'users.json'
          var promise = $http.get(url).then(function(response){
              return response.data;
          });
          return promise;
        };    
    

Call this function from the controller.

    
        Model.get_user_list().then(function(d){
                $scope.users =  d;
        });
    
    
Create save method in the model.js file.

    ...
    var Model = {
      get_user_list: get_user_list,
      save: save,
      
    };
    ....

    function save(user,callback) {
        var url = 'users/save';
        return $http.post(url,user).then(callback);
    };
    
        
Add routing in the routers/users.js


    
    router.post('/save', function(req, res, next) {
        var obj = JSON.parse(fs.readFileSync(global.appRoot + '/public/users.json', 'utf8'));
        obj[id] = {
           id: id,
           name: data.name,
       };
        fs.writeFile(global.appRoot + '/public/users.json', JSON.stringify(obj), function(err) {
            if(err) {
                return console.log(err);
            }

            console.log("The file was saved!");
        });
        res.send('ok');
    });

        
    
Define  global.appRoot in app.js file.   
    
    global.appRoot = path.resolve(__dirname);
    
    
