exports.setup = (app)->
    app.get('/contact', (req,res)->
        res.send('Contact!!')
)

