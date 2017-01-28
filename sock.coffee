module.exports = (io)->
    sockets = {}
    io.on 'connection', (client)->
        console.log('Client connected...')

        client.on 'join', (data)->
            sockets[data.user_id] = client
            io.emit('someone_joined', {user_id: data.user_id, act: 'someone_joined'});

        client.on 'disconnection', (data)->
            delete sockets[data.user_id]
            io.emit('someone_left', {user_id: data.user_id, act: 'someone_left'});
###
    setInterval ()->
        time = new Date()
        io.emit('time', {time: time});
        console.log "just have sent #{time}"
    ,5000
###
