##Angular form validation

    <form>
        <input type="text" ng-model="name" required />
        <input type="submit" name="go" value="go">
    </form>
    
###ng-minlength    


        <input type="text"  ng-minlength=5 />
        
###Others        
        
    <input type="url" />

    <input type="number" />  

    <input type="email" />
      

##Error message

      <label>
        Enter text:
        <input type="email" ng-model="field" name="myField" required>
         <span ng-show="myForm.myField.$error.required">Error</span>
      </label>

##Custom validator



    angular.
      module('testApp').directive('integer', function() {
      return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
          ctrl.$validators.integer = function(modelValue, viewValue) {
            var INTEGER_REGEXP = /^-?\d+$/;
            if (ctrl.$isEmpty(modelValue)) {
              // consider empty models to be valid
              return true;
            }

            if (INTEGER_REGEXP.test(viewValue)) {
              // it is valid
              return true;
            }

            // it is invalid
            return false;
          };
        }
      };
    });
