module.exports = (io)->
    sockets = {}
    users_online = []
    io.on 'connection', (client)->
        console.log('Client connected...')

        client.on 'join', (data)->
            sockets[data.user_id] = client
            users_online.push(data.user_id)
            io.emit('someone_joined', {user_id: data.user_id, act: 'someone_joined', users_online: users_online});

        client.on 'disconnection', (data)->
            delete sockets[data.user_id]
            index = users_online.indexOf data.user_id # <-- Not supported in <IE9
            if index != -1
                users_online.splice(index, 1)
            io.emit('someone_left', {user_id: data.user_id, act: 'someone_left', users_online: users_online});

        client.on 'send_message', (data)->
            console.log data
            sockets[data.to_user_id].emit('take_message',{message: data.message})
            #sockets[data.user_id] = client
            #users_online.push(data.user_id)
            #io.emit('someone_joined', {user_id: data.user_id, act: 'someone_joined', users_online: users_online});
