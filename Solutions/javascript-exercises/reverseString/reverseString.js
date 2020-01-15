const reverseString = function(string) {
  splitString = string.split("");
  newString = []
  for (let i=0; i < string.length; i++){
    character = splitString.pop();
    newString.push(character);
  }
  return newString.join('')
}

module.exports = reverseString
