const removeFromArray = function(arr, ...input) {
  for (i=0; i < arr.length; i++){
    for (j=0; j < input.length; j++){
      if (arr[i] == input[j]){
        arr.splice(i,1);
        i--;
      }
    }
  }
  return arr;
}

module.exports = removeFromArray
