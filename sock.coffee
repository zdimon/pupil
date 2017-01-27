module.exports = (io)->
    sockets = {}
    io.on 'connection', (client)->
        console.log('Client connected...')

        client.on 'join', (data)->
            sockets[data.user_id] = ''
            console.log sockets

        client.on 'disconnect', (data)->
            delete sockets[data.user_id]
            console.log 'ssssssssssssssssssssss'
###
    setInterval ()->
        time = new Date()
        io.emit('time', {time: time});
        console.log "just have sent #{time}"
    ,5000
###
