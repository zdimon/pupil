express = require('express')
router = express.Router()
fs = require('fs')

#Create db if not exists


fs.exists global.appRoot + '/public/users.json', (exists)->
    if !exists
        fs.writeFile global.appRoot + '/public/users.json', '{}', (err, data)->
            console.log('Database was created!!!!')


router.get '/remove/:id', (req, res, next)->
    obj = getUsers()
    delete obj[req.params.id]
    saveUsers(obj)
    res.send('ok')
 
getUsers = ()->
    JSON.parse(fs.readFileSync(global.appRoot + '/public/users.json', 'utf8'))


saveUsers = (obj)->
    fs.writeFile global.appRoot + '/public/users.json', JSON.stringify(obj), (err)->
        if(err)
            return console.log(err)
        console.log "The file was saved!"





ObjectLength = (object)->
    max = 0;
    for key in object
        console.log key
        if  key > max
            max = key


    parseInt(max)


addUser = (obj,data)->
   console.dir()
   if data.is_edit
       id = data.id
   else
       id = ObjectLength(obj) + 1


   obj[id] =
       id: id
       name: data.name
       email: data.email
       about: data.about
       date: data.date
       is_married: data.is_married



router.post '/save', (req, res, next)->
    obj = getUsers()
    addUser obj,req.body
    saveUsers obj
    res.send 'ok'



module.exports = router
