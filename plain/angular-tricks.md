#Angular tricks

##Change css class

    ng-class="{'item-text-wrap':viewMore}" ng-click="viewMore= !viewMore"


##Touch tools

    https://docs.angularjs.org/api/ngTouch



##ngSanitize

    ng-bind-html="article.text"


##Extend

Copying own enumerable properties from the src object(s) to dst

    object = angular.extend({}, object1, object2)


##angular.forEach

Invokes the iterator function once for each item in obj collection, which can be either an object or an array. 


    var values = {name: 'misko', gender: 'male'};
    var log = [];
    angular.forEach(values, function(value, key) {
      this.push(key + ': ' + value);
    }, log);
