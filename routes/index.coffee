express = require('express')
router = express.Router()
multer  = require 'multer'
path = require 'path'


storage = multer.diskStorage
    destination: './uploads'
    filename: (req, file, cb)->
        cb null, (Math.random().toString(36)+'00000000000000000').slice(2, 10) + Date.now() + path.extname(file.originalname)

upload = multer
    storage: storage
    dest: 'uploads/'
    #rename:  (fieldname, filename)->
    #    filename.replace(/\W+/g, '-').toLowerCase() + Date.now();


router.get '/', (req, res, next)->
    res.render 'layout'

router.post '/upload', upload.any(), (req, res, next)->
    res.json {'message': 'ok'}


module.exports = router
