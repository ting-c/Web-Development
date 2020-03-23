const palindromes = function(string) {
  var string = string.toLowerCase().replace(/[^a-z ]/g, "");
  length = string.length;
  count = 0;
  for (i=0; i <= length - 1; i++){
    if (string[i] != string[(length-1) - i]){
      return false;
    };
  return true;
  }
}

module.exports = palindromes
