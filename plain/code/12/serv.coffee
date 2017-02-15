'use strict';
http = require 'http'
url = require 'url'

server = http.createServer (req,res)->
    try
        path = url.parse(req.url).pathname
        res.end("hello from #{path}")
        myf()
        console.log "got request"
    catch ex
        res.end("Error #{ex}") 
        

myf = ()->
    console.log 'one'
    console.log 'two'
    console.log 'three'



server.listen 8088
console.log 'Server running on 8080'
