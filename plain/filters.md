##Filters

    {{ name | uppercase }}
    
  
Service

      $scope.name =  $filter('uppercase')('Hello');
  
###Date and numbers      
      
      {{  123.129 | number:2  }}
      
      {{  123.129 | currency  }}  
    
     {{ today | date:medium }}
     
     
###Filter


    {{ ['Art', 'Likes', Pizza] | filter: 'A'}}     
    
     
    <p> {{ [ {name: 'Jon'}, {name: 'Mikle'}, {name: 'Pit'} ] | filter: {name: 'Pit'} }} </p>
    
    
Filter based on function.

    <p>  {{ ['One', 'two', 'Three'] | filter:isCapitalized }}  </p>

    $scope.isCapitalized = function(str){
        return str[0] == str[0].toUpperCase();
    };

###limitTo    
    
    <p>  {{ 'San Francisco is very cloudy' | limitTo:3 }}  </p>    
    
    <p>  {{ [1,2,3] | limitTo:1 }}  </p>
    
    
    
    
###orderBy   
  
  
## Custom filter

    .filter('myfilter', function(){

        return function(s){
                return '----'+s+'-----';
               }

    })
        

  
  