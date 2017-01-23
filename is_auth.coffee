is_auth = (pars)->
    query = (req,res,next)->
        console.log 'Authentication'
        console.log pars
        console.log req.session
        next()
    return query

module.exports = is_auth
