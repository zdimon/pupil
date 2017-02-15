##Angular directives

##Build-in directive

    ng-href (dinamically creation ng-href="{{ myvar }}")
    ng-src
    ng-disabled (<input ng-disabled="1==1" />)    
    ng-checked
    ng-readonly
    ng-selected
    ng-class (ng-class="{'item-text-wrap':viewMore}")
    ng-click

    ng-class="{'item-text-wrap':viewMore}" ng-click="viewMore= !viewMore"
    
    ng-class


    ng-include  (include an external HTML into your app) 
    <div ng-include src="'test.html'" ng-controller="myCtrl" ng-init="name = 'World'"> 
        Hello {{ name }}
    </div>


    ng-switch

    <ANY ng-switch="expression">
      <ANY ng-switch-when="matchValue1">...</ANY>
      <ANY ng-switch-when="matchValue2">...</ANY>
      <ANY ng-switch-default>...</ANY>
    </ANY>

    ng-repeat
        $index
        $first
        $middle
        $last
        $even
        $odd

        ng-reapeat="i in items" ng-class="even: $even, odd: $odd"

    ng-view
    ng-controller
    ng-if


    ng-init
    <div ng-init="name = 'World'"> 
        Hello {{ name }}
    </div>


    ng-bind

        <p ng-bind="myvar"></p>  =  <p> {{ myvar}} </p>

    - preventing FOUC (flash of unstyled content)

    ng-cloak

        <p ng-cloak> {{ myvar }} </p>

    ng-model
    ng-model-options

    Hello {{ name }}
    <input ng-model="name" ng-model-options="{ updateOn: 'blur', debounce: 2000 }">


    ng-show/ng-hide


    ng-change
    
    <input ng-model="foo" ng-change="change()">

##Forms

    ng-form - nest forms

###Validators

    ng-valid
    ng-invalid
    ng-dirty
    ng-pristine 

    ng-submit


##Defining custom directives

    <myform></myform>

Note: Use prefix!


##Parent scope

    .directive('myForm', function(){
    
        return {
            restrict: 'E',
            scope: false,
            template: '<h1>Hello {{myname}}</h1>'
        }


    $scope.name = 'Dima';  
        
    template: '<h1> Hello {{name}} </h1>'



##Restriction

    A - attribute
    C - class
    E - element
    M - comments (<!-- blavla -->)


##Expression

    
    <my-directive attr="someExpression"> </my-directive>   
    <div my-directive="someExpression"></div>
    <div class="my-directive:someExpression"></div>
    <!-- directive: my-directive someExpression -->


##Priority (Number)

    ng-repeat has 1000

##Terminal

    - stope invoke directives with lower priority 
    

##Replacing

    replace: true

##Looping thrue collection


    $scope.list = [
        new Person('Vova','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrIR8y9HuctcJr5Yw2QOzK0ze7NnE4AtEpweVBjcF3RTRAK4w'),
        new Person('Boris', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRzLuveQaXViF2Q1IUYGkX-oxx4JYOW-uDVNkrkOGPAzNA412he')
    ];
    

       <ul>
            <li ng-repeat="p in list"><p class="person" p="p"></p></li>
       </ul>


    .directive('person', function(){
    
        return {
            restrict: 'C',
            scope: {
                p: '='
            },
            transclude: true,
            template: '<img src="{{ p.image }}" /> {{ p.name }}'
        }
    
    })  



##Isolate scope

- @ (interpolate)
- = (bind)
- & (expression)


##Interpolate

    //directive
    scope: {
                myname: '@name',     
           },
     template: '<h1>Hello {{myname}}</h1>'

    // controller   
    $scope.me = 'Dima';

    //template
    <my-form name="{{ me }}">


Note:

    /// Object interpolation
    $scope.me = { firsname: 'Dima', lastname: 'Zharikov'};

    //tpl
    <my-form me="{{ me }}">

    scope: {
        me: '@'
    },   


##Bind

    //directive

    scope: {
        myname: '=name'
    },
    template: '<h1>Hello {{myname}}</h1> <input type="text" ng-model="myname">'

    
    // controller   
    $scope.me = 'Dima';

    //template


##Expression

    scope: {
        me: '&'
    },
    template: '<h1>Hello {{ me() }} </h1>'


    //tpl 
    <my-form me="name = 'I am '+39+' years old' ">

##Link function


    link: function(scope,el,attr){
        
        scope.me = scope.me(); 

    },    

    $(el).effect('shake');
    console.log(attr.flag);

###JQuery UI

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


##Transclusion

    //Template
    <person person="person">
        <h2> Title from view </h2>
    </person>

    //ctrl
    $scope.person = new Person(45, 'Vova');


    return {
        restrict: 'E',
        scope: {
            person: '='
        },
        transclude: true,
        template: '<div ng-transclude></div><h1>Name - {{ person.name }}</h1>'
        }


##Communication between derictives.


###Initial data

        $scope.books = {
            '1': 'Jack London',
            '2': 'O`Genry',
            '3': 'K. Marks'
        };


        $scope.users = [
            {name: 'Artur', books:[1,2]},
            {name: 'Fedor', books:[2]},
            {name: 'Ivan', books:[1,3]}
        ];


        //tpl
        <users list="users"> 
            <h3> Users </h3>
        </users>


        ///directive

        return {
            restrict: 'E',
            scope: {
                list: '='
            },
            transclude: true,
            template: '<p ng_transclude></p><ul><li ng-repeat="u in list">{{ u.name }}</li></ul>'


##Create child directive


    template: '...<books user="u"></books>..'


        return {
            restrict: 'E',
            require: '^users',
            scope: {
                user: '='
            },
            link: function(scope,el,attr,users){
                scope.books = users.getBooks(scope.user);
            },
            template: '<strong> {{ books }} </strong>'
        }

    }) 


##Retrieve books. 


    <users list="users" books="books"> 


        scope: {
            list: '=',
            books: '='
        },
        controller: function($scope){
            
            this.getBooks = function(user){
                var books = [];
                angular.forEach(user.books,function(v,k){
                    books.push($scope.books[v]);
                });
                return books;
            }
        },



        .directive('books', function(){
        
            return {
                restrict: 'E',
                require: '^users',
                scope: {
                    user: '='
                },
                link: function(scope,el,attr,users){
                    scope.books = users.getBooks(scope.user);
                },
                template: '<strong> {{ books }} </strong>'
            }
        
        })   

##Multiple directive using

- create a new simple directive

    .directive('tst', function(){
    
        return {
            restrict: 'E',
            transclude: true,
            controller: function(){
                
                this.getTags = function(){          
                    return 'javascropt, angular';
                }
            },
            template: '<p ng_transclude></p>'
        }
    
    }) 


##Wrap another directives

        <tst>
           <users list="users" books="books"> 
                <h3> Users </h3>
                
            </users>
        </tst>    


##Calling

            require: ['^users', '^tst'],
            ....
            link: function(scope,el,attr,ctrls){
                scope.books = ctrls[0].getBooks(scope.user) +' '+ ctrls[1].getTags(scope.user);
            }, 


##Link function

The link function are run in the opposite order that they are complmpiled in.


       <out>
           <in> 
                <superin>
                </superin>
            </in>
        </out>




        .directive('out', function(){
        
            return {
                restrict: 'E',
                link: function(s,e,a){
                  console.log('out');              
                }        
            }
        
        }) 


        .directive('in', function(){
        
            return {
                restrict: 'E',
                link: function(s,e,a){
                  console.log('in');              
                }        
            }
        
        }) 


        .directive('superin', function(){
        
            return {
                restrict: 'E',
                link: function(s,e,a){
                  console.log('superin');              
                }        
            }
        
        }) 

Link function is the best place to  manipulate the DOM as we can sure that all of the child directives are compliled. 


##Watching

    
    .directive('watcher',function(){

        return {
            restrict: 'E',
            template: '<p> {{ flag }} </p>',
            link: function(s,e,a){
                s.$watch('flag', function(oldv,newv){
                    console.log(oldv+'-'+newv);
                });
            }
        }

    })


    

