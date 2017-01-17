express = require 'express'
router = express.Router()

# GET home page.
router.get '/', (req, res, next) ->
  res.render 'index',
    title: 'Express'

router.get '/get_messages', (req, res, next) ->
  res.send [
      {message: 'Hello'}
      {message: 'Everybody'}
    ]

module.exports = router
