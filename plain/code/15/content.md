# Content

1. Three watch depths.


https://teropa.info/blog/2014/01/26/the-three-watch-depths-of-angularjs.html
    
    - reference watches 
    - collection watches 
    - equality watches
    
    
##reference watches     
    
You register a reference watch by providing a falsy value as the third argument to $watch or by just omitting the third argument:

    $scope.$watch(…, …, false);
    
    
The references are compared using the strict equality operator ===.
    
{{ }}, the ngBind directive, and the ngBindHtml directive

ngMultiple, ngSelected, ngChecked, ngDisabled, ngReadOnly, ngRequired, and ngOpen
The ngModel directive
The ngClass directive
The ngIf, ngShow, and ngHide directives
The ngInclude directive
The ngPluralize directive
The ngSwitch directive
The select directive
 
    
##collection watches    
    
    $scope.$watchCollection(…, …);

Collection watches are used internally by Angular in the ngRepeat directive.


##equality watches

    $scope.$watch(…, …, true);

Equality watches are used internally by Angular in the ngClass and ngStyle directives on their attribute expressions.


##One way binding

    {{ ::myvar }}
    
    {
        name: '=*'
    }

2. Controller inheritance.

3. Yo

4. Form validation.

5. Testing













