sayname = function(){
	console.log('my name is dimitry')
}

obj = {
	name: 'dima',
	go: function() {
		console.log('top top')
	}
}

module.exports.sayname = sayname
module.exports.man = obj