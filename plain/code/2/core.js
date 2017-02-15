global.name = 'Dima';
console.log(global);
console.error('Error');

    console.time('items');
    for(var i = 0; i<1000; i++){
        console.log(i);
    }
    console.timeEnd('items');
    console.trace();

console.log(process.execPath);
console.log(process.version);
console.log(process.platform);

console.log(process.moduleLoadList);


/*
process.on('exit',function(code){
        console.log('Exit with code '+code);
    })

process.exit(0);
*/

    process.argv.forEach(function(val,indx,array){
        console.log(indx+'-'+val);
    });

console.log(process.memoryUsage());

    process.nextTick(
        function(){
            console.log('next callback');
        });

