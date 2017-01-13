##Express coffee script generator

    npm install -g express-coffeescript-generator
    
    express-cs myprj
    
Rename bin/www to bin/www.coffee

Edit start command.

    
  "scripts": {
    "start": "nodemon ./bin/www.js -e coffee" 
  },    
  
Compile js.

    coffee -c .
    
      