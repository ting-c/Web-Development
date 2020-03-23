const repeatString = function(string, number) {
  if (number < 0){
    return "ERROR"
  }
  if (number == 0){
    return ""
  }
  newString = string
  for (let i = 1; i < number; i++){
    newString = string+newString
}
return newString
}

module.exports = repeatString
