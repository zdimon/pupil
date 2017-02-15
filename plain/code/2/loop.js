var i, myarray = ['one','two'],
max = myarray.length;

for (i = max; i--;) {
 console.log('i='+i);
}


    var myarray = ['one','two'],
    i = myarray.length;

    while (i--) {
      console.log('i='+i);
    }


var me = {
        name: 'Dima',
        age: 39,
        weight: 75
    }

    for( p in me)if (p!='name'){
        console.log(p+':'+me[p]);
    }
