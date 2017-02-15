##Deploy 

https://www.npmjs.com/package/node-ssh


    sudo npm install node-ssh
    
    

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
                    console.log('get dir');
                    ssh.exec('pwd',[], {cwd: '/var/www', stream: 'stdout' }).then( function(res) 
                        {
                            console.log('get dir');
                            console.log(res);
                            ssh.dispose();
                        },    function(error) {
                            console.log("Something's wrong")
                            console.log(error)
                          });
                    process.exit();
                }
        )
        .then(
            
        );
        
        
        console.log('Finished');
        


