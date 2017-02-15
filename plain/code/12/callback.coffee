add = (a,b)->
    a+b


add = (a,b, callback)->
    setTimeout ()->
        callback(a+b)
    ,10


console.log 'before'
add 1,2,(res)->
    console.log 'result '+ res
console.log 'after'

i = 0

showdt = ()->
    i = i + 1
    console.log i
    process.nextTick showdt




showdt()
