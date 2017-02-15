
(function(){

   

	var app = {
	
	    utils: {}, 
	     
	    add: function (name,fn) {
	    
	        this.utils[name] = fn; 
	    
	    },
	     
		say: function(namefn){
			utils[namefn]();
		}	
	
	};
	this.app = app;
})()