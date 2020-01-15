const caesar = function(string, shift) {
  shiftedWord = ''
  for (i=0; i<string.length; i++){
    code = string.charCodeAt(i);
    if (code <= 64){
      char = String.fromCharCode(code);
      shiftedWord += char;
      continue;
    }
      else if (code >= 91 & code <= 96) {
        char = String.fromCharCode(code);
        shiftedWord += char;
        continue;
      }
      else if (code >= 123) {
      char = String.fromCharCode(code);
      shiftedWord += char;
      continue;
      }
    if (shift > 26){
      shift %= 26;
    }
    else if (shift < 0){
      shift = 26 + shift;
    }
    codeShift = code + shift;

    if (codeShift >= 91 & code <= 90){
      codeShift -= 26;
    }
    else if (codeShift >= 123 & code <= 122){
      codeShift -= 26;
    }

    char = String.fromCharCode(codeShift);
    shiftedWord += char
  }

  return shiftedWord
}

module.exports = caesar
