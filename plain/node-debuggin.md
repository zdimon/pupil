##Node debugging

##Simple program

    sum = 0
    for i in [1..10]
        console.log "iteration #{i}"


##Simple debugging

    node debug serv.js

## Commands

c - continue

n - next

s - step in

o - step out


setBreakpoint  sb() clearBreakpoints cb()

watch()



##Make simple server

    'use strict';
    http = require 'http'

    server = http.createServer (req,res)-> 
        path = url.parse(req.url).pathname
        res.end("hello from #{path}")

            
    server.listen 8080
    console.log 'Server running on 8080'    

##Error handling

    try
        path = url.parse(req.url).pathname
        res.end("hello from #{path}")
    catch ex
        res.end("Error #{ex}")



    try
        path = url.parse(req.url).pathname
        res.end("hello from #{path}")
        console.log "got request"
        debugger;

    repl - invaluate


##Breakpoint 

###Debugger

    server = http.createServer (req,res)->
        try
            path = url.parse(req.url).pathname
            res.end("hello from #{path}")
            debugger;
            myf()
            console.log "got request"
            debugger;
        catch ex
            res.end("Error #{ex}")
            

    myf = ()->
        console.log 'one'
        console.log 'two'
        console.log 'three'



###Watcher 

    watch(path)

###Node inspector

    npm install -g node-inspector


##Start node inspector

    node-inspector

###start script


    node --debug-brk serv




