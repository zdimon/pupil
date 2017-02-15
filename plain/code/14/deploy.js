fs = require('fs')
path = require('path')
node_ssh = require('node-ssh')
ssh = new node_ssh()
 
ssh.connect({
  host: '178.136.229.252',
  username: 'zdimon',
  privateKey: '/home/zdimon/.ssh/id_rsa'
})
.then(
    function(){
        console.log('Connected');
    },
    function(error) {
    console.log("Something's wrong")
    console.log(error)
  }
)
.then(
        function()
            {
                 ssh.exec('pwd',[], { stream: 'stdout' }).then( function(res) 
                    {
                        console.log('get dir one');
                        console.log(res);
                    },    function(error) {
                        console.log("Something's wrong")
                        console.log(error)
                      });   
            }
    )
.then( function(){
    

   
              return  ssh.exec('pwd',[], { stream: 'stdout' }).then( function(res) 
                    {
                        console.log('get dir two');
                        console.log(res);
                        ssh.dispose();
                    },    function(error) {
                        console.log("Something's wrong")
                        console.log(error)
                      });    
    
        
    
   
})

.then(

    function(){
    
    console.log('Finished');
    
    }

)
