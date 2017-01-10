
Model = ($http)->

    get_user_list = (callback)->
        url = 'users.json'
        return $http.get(url).then callback
        
        

    remove = (id,callback)->
        url = 'users/remove/'+id
        return $http.get(url).then callback
    
 

    save = (user,callback)->
        url = 'users/save'
        return $http.post(url,user).then callback 
    


    Model = 
        get_user_list: get_user_list
        save: save
        remove: remove
    return Model
    
Model.$inject = ['$http']

angular.module 'pupilApp'
.factory 'Model', Model
