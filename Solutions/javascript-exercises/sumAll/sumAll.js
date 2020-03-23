const sumAll = function(a,b) {

  if (Number.isInteger(a) & Number.isInteger(b)){
    var k = 0
    if (a < 0 || b < 0){
      return 'ERROR'
    }
    if (a > b){
      for (let i = a; i >= b; i--){
        k += i;
      }
    }
    else {
      for (let i = a; i <= b; i++){
        k += i;
      }
    }
    return k;
  }
  else {
    return 'ERROR';
  }

}

module.exports = sumAll
