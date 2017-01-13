##Pages

##Install angular router.

    npm install --save angular-route
    
##Add script

    script(src="node_modules/angular-route/angular-route.js")

##Change app.coffee and add ngRoute.

    app = angular.module('pupilApp', ['ngRoute'])  

##Add block with ng-view direrctive to mark where we will place our pages.

    div(style="padding-top: 60px")
        block content
        div(ng-view)

##Configure routes and views.

    angular.module('pupilApp', ['ngRoute'])
    .config ($routeProvider,$locationProvider)->
        $routeProvider
        .when '/',
            templateUrl : 'pages/users.html'
            controller  : 'userCtrl'
        .when '/page',
            templateUrl : 'pages/page.html'
            controller  : 'pageCtrl'
        .otherwise
            redirectTo: '/'

        $locationProvider.hashPrefix('')

##Create users.jade

    h1 Users

    div(ng-controller="userCtrl")
        div.well
            h1 Пользователи

            table.table
                thead
                    tr
                        th #
                        th Логин
                        th ФИО
                        th email
                        th Инфо
                        th Женат?
                        th Родился
                tbody
                    tr(ng-repeat="u in users"  ng-click="edit(u.id)")
                        th {{ u.id }}
                        td {{ u.name }}
                        td {{ u.fio }}
                        td {{ u.email }}
                        td {{ u.about }}
                        td {{ u.is_married }}
                        td {{ u.date }}
                        td
                            a.blue-text
                                i(class="glyphicon glyphicon-pencil" ng-click="edit(u.id)")
                            a.teal-text
                                i(class="glyphicon glyphicon-remove-sign" ng-click="remove(u.id)")

        div.well
            form.form-horizontal
                div.form-group
                    label(class="control-label col-sm-2") Логин
                    div.col-sm-10
                        input.form-control(ng-model="user.name")

                div.form-group
                    label(class="control-label col-sm-2") email
                    div.col-sm-10
                        input.form-control(ng-model="user.email")

                div.form-group
                    label(class="control-label col-sm-2") about
                    div.col-sm-10
                        textarea.form-control(ng-model="user.about")

                div.form-group
                    label(class="control-label col-sm-2") about
                    div.col-sm-10
                        input.form-control(type="checkbox" ng-model="user.is_married")

                div.form-group
                    label(class="control-label col-sm-2") Родился
                    div.col-sm-10
                        input.form-control(ng-model="user.date" id="date")

                div.form-group
                    label(class="control-label col-sm-2")
                    div.col-sm-10
                        button(type="button" class="btn btn-success" ng-click="save()") Save




##Auto compilation

    jade -w public/pages


##Remove index.jade from nodejs app.

    router.get '/', (req, res, next)->
        res.render 'layout'    

##Install pg


    npm install pg@6.1.0 --save

## Create connection and table.

    connectionString = 'postgres://postgres:pass@localhost:5432/todo'
    client = new pg.Client connectionString
    client.connect()
    query = client.query 'CREATE TABLE IF NOT EXISTS pages(id SERIAL PRIMARY KEY, title VARCHAR(40) not null, text TEXT, published BOOLEAN)'



## Create list routing.


    router.get '/list', (req, res, next)->
        results = [];
        query = client.query('SELECT * FROM pages ORDER BY id ASC;');
        query.on 'row', (row) ->
            results.push(row);
        query.on 'end', () ->
            res.send results

###Add angular model (fabric).

    .factory 'Page', [
        '$http',
        '$rootScope',
        ($http)->
            list = (cb)->
                $http.get('/pages/list').then cb
            save = ()->
                console.log  'save'
            del = ()->
                console.log 'delete'
            get = ()->
                console.log 'get'
            return {
                list: list
                save: save
                del: del
                get: get
            }
    ]



###Use Page model in controller.


    .controller 'pageCtrl', [
        '$scope'
        'Page'
        ($scope, Page)->

            update_list = ()->
                Page.list (r)->
                    $scope.pages = r.data
            update_list()
        ]


### Render data in template.

        
    h1 Страницы

    TABLE.table
        thead
            tr
                th #
                th Заголовок
                th Действия
        tbody
            tr(ng-repeat="p in pages")
                td
                    {{ p.id }}
                td
                    {{ p.title }}
                td
                    a(href="#" ng-click="edit(p.id)") Редактировать
                    a(href="#" ng-click="delete(p.id)") Удалить

###Add routing for deleting updating and detail requests.


    router.post '/save', (req, res, next)->
        page = req.body
        if page.is_new
            client.query 'INSERT INTO pages(title,text) values($1, $2)',
                page.title
                page.text
        else
            client.query 'UPDATE items SET text=($1), complete=($2) WHERE id=($3)',
                page.title
                page.text
                page.id
        res.send 'ok'

    router.get '/detail/:id', (req, res, next)->
        query = client.query 'SELECT * FROM pages WHERE id=($1);', [req.params.id]
        query.on 'row', (row) ->
            res.send row

    router.get '/delete/:id', (req, res, next)->
        query = client.query 'DELETE FROM pages WHERE id=($1);', [req.params.id]
        query.on 'end', (row) ->
            res.send 'ok'



