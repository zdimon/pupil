var express = require('express');
var router = express.Router();
var fs = require('fs');

/// Create db if not exists



fs.exists(global.appRoot + '/public/users.json', function (exists) {
        if(!exists)

        {
            fs.writeFile(global.appRoot + '/public/users.json', '{}', function (err, data)
            {
                    console.log('Database was created!!!!');
            })
        }
    });



/* GET users listing. */
router.get('/remove/:id', function(req, res, next) {
  var obj = getUsers();
  delete obj[req.params.id];
  saveUsers(obj);
  res.send('ok');
});

function getUsers(){

    return JSON.parse(fs.readFileSync(global.appRoot + '/public/users.json', 'utf8'));

};

function saveUsers(obj){

    fs.writeFile(global.appRoot + '/public/users.json', JSON.stringify(obj), function(err) {
        if(err) {
            return console.log(err);
        }

        console.log("The file was saved!");
    });

};



function ObjectLength( object ) {
    var max = 0;
    for( var key in object ) {
        console.log(key);
        if( key> max) {
            max = key;
        }
    }
    return parseInt(max);
};

function addUser(obj,data){
   console.dir();
   if(data.is_edit){
       id = data.id;
   } else {
       id = ObjectLength(obj) + 1;
   }

   obj[id] = {
       id: id,
       name: data.name,
       email: data.email,
       about: data.about,
       date: data.date,
       is_married: data.is_married
   };

};

router.post('/save', function(req, res, next) {
    var obj = getUsers();
    addUser(obj,req.body);
    saveUsers(obj);
    res.send('ok');
});


module.exports = router;
