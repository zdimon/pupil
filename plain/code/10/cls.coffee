#Class in coffeescript

class Animal
    constructor: (@attributes) ->
        console.log @attributes
    move: (meters)->
        return " '#{@attributes.name}' moved #{meters}"
    do: ->
        console.log 'I do'

a = new Animal 'Just animal'
a.move(200)

class Cat extends Animal
    sayName: ->
        console.log @attributes.name
    move: ->
        par = super
        console.log 'ssssss'
    @givemeten: ->
        ret = []
        for i in [1..10]
            console.log 'append'
            ret.push new Cat({name: 'Dima'})
            #ret.push @
        ret
    
c = new Cat({name: 'Vasya'})

s = c.givemeten()

for c in s
    console.log c
    c.do()


