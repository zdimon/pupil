##Angular Bootstrap

https://github.com/angular-ui/bootstrap
https://angular-ui.github.io/bootstrap/


###Instalation 

    npm install angular-ui-bootstrap
    
    
    app = angular.module('myApp',['ui.bootstrap'])
    
    
    <script src="node_modules/angular-ui-bootstrap/dist/ui-bootstrap.js" ></script>    
    
###Accordion

The accordion directive builds on top of the collapse directive to provide a list of items, with collapsible bodies that are collapsed or expanded by clicking on the item's header.    

          <uib-accordion close-others="oneAtATime">

            <div uib-accordion-group class="panel-danger" heading="Delete account">
              <p>Please, to delete your account, click the button below</p>
              <button class="btn btn-danger">Delete</button>
            </div>
            <div uib-accordion-group class="panel-default" is-open="status.open">
              <uib-accordion-heading>
                I can have markup, too! <i class="pull-right glyphicon" ng-class="{'glyphicon-chevron-down': status.open, 'glyphicon-chevron-right': !status.open}"></i>
              </uib-accordion-heading>
              This is just some content to illustrate fancy headings.
            </div>
           </uib-accordion>
          
          
Note: Unknown provider: $$MapProvider - check out Angular version!!! 



    <div uib-accordion-group class="panel-default" heading="Custom template" template-url="group-template.html">
      Hello
    </div>
    

###Carousel


            $scope.items = ['uno', 'quadro']
            
            var slides = $scope.slides = [];
          
              $scope.addSlide = function(i) {
                slides.push({
                  image: 'images/' + i + '.jpg',
                  text: 'Nice image '+i,
                  id: i
                });
              };            
            
            for (var i = 0; i < 4; i++) {
                $scope.addSlide(i);
            }
            
     

        <div uib-carousel active="active" interval="myInterval" no-wrap="noWrapSlides">
          <div uib-slide ng-repeat="slide in slides track by slide.id" index="slide.id">
            <img ng-src="{{slide.image}}" style="margin:auto;">
            <div class="carousel-caption">
              <h4>Slide {{slide.id}}</h4>
              <p>{{slide.text}}</p>
            </div>
          </div>
        </div>  
    

###Date picker

     <div uib-datepicker ng-model="dt" class="well well-sm" datepicker-options="options"></div>

     $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };
  
  
##Dropdown

    <div class="btn-group" uib-dropdown is-open="status.isopen">
      <button id="single-button" type="button" class="btn btn-primary" uib-dropdown-toggle ng-disabled="disabled">
        Button dropdown <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" uib-dropdown-menu role="menu" aria-labelledby="single-button">
        <li role="menuitem"><a href="#">Action</a></li>
        <li role="menuitem"><a href="#">Another action</a></li>
        <li role="menuitem"><a href="#">Something else here</a></li>
        <li class="divider"></li>
        <li role="menuitem"><a href="#">Separated link</a></li>
      </ul>
    </div>
    
    
##Modal window


        <script type="text/ng-template" id="mmm.html">
            <div class="modal-header">
                <h3 class="modal-title" id="modal-title">I'm a modal!</h3>
            </div>
            <div class="modal-body" id="modal-body">
                    Hi
            </div>
        </script>     
    
    

            $scope.open = function(){
                var modalInstance = $uibModal.open({
                      templateUrl: 'mmm.html',
                      controller: function(){},
                      }
                 );               
            };
      
  


         