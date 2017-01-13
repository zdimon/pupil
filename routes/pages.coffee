express = require 'express'
router = express.Router()
pg = require 'pg'
connectionString = process.env.DATABASE_URL || 'postgres://postgres:1q2w3e@localhost:5432/todo'
client = new pg.Client connectionString
client.connect()
query = client.query 'CREATE TABLE IF NOT EXISTS pages(id SERIAL PRIMARY KEY, title VARCHAR(40) not null, text TEXT, published BOOLEAN)'

#query.on 'end', () ->
#    client.end()


router.get '/list', (req, res, next)->
    results = [];
    query = client.query('SELECT * FROM pages ORDER BY id ASC;');
    query.on 'row', (row) ->
        results.push(row);
    query.on 'end', () ->
        res.send results

router.post '/save', (req, res, next)->
    page = req.body
    if page.is_new
        client.query 'INSERT INTO pages(title,text) values($1, $2)',
            page.title
            page.text
    else
        client.query 'UPDATE items SET text=($1), complete=($2) WHERE id=($3)',
            page.title
            page.text
            page.id
    res.send 'ok'

router.get '/detail/:id', (req, res, next)->
    query = client.query 'SELECT * FROM pages WHERE id=($1);', [req.params.id]
    query.on 'row', (row) ->
        res.send row

router.get '/delete/:id', (req, res, next)->
    query = client.query 'DELETE FROM pages WHERE id=($1);', [req.params.id]
    query.on 'end', (row) ->
        res.send 'ok'

module.exports = router
