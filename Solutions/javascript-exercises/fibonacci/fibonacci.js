const fibonacci = function(n) {
  if (typeof n == 'string'){
    n = parseInt(n);
  };
  if (n <= 0){
    return "OOPS";
  }
  else if (n == 1 && n == 2) {
    return "1";
  };
  var array = [1, 1];
  for (i=2; i < n; i++){
    term = array[i-2] + array[i-1];
    array.push(term);
  }
  return array[n-1];
};


module.exports = fibonacci
