exports.setup = (app)->
    app.get('/contact', (req,res)->
        res.send([
                    {'id': 1, 'name': 'Piter', 'phone': '342534'},
                    {'id': 2, 'name': 'John', 'phone': '842534'},
                    {'id': 3, 'name': 'Mike', 'phone': '642534'},
                 ])
)
