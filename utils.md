#Utils

##Automatically create simlink on node_modules dir.

    fs = require 'fs'
    exec = require('child_process').exec;


    .........

    fs.lstat global.appRoot+'/public/node_modules', (err, stats)->
        if err
            cmd = "ln -s #{global.appRoot}/node_modules public/node_modules"
            exec cmd, (err,stdout, stdin)->
                console.log 'creating simlink'    

##Color console

    color = require 'cli-color'

    chalk = require 'chalk'
    console.log color.red('Text in red')   


##Compilation coffeescripts after any changing.


#Build coffeescripts

    cmd = "coffee -c  -o #{global.appRoot}/public/javascripts/build/ #{global.appRoot}/public/javascripts/"
    exec cmd, (err,stdout, stdin)->
        console.log color.red('Compilation of the frontend coffeescripts is done!')
    
