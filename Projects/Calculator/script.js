const screenDisplay = document.querySelector("#screen");

displayVal = "";
input = "";

dict = {"0" : "#d0",    "." : "#decimal",  "c" : "#clear",
        "1" : "#d1",    "2" : "#d2",       "3" : "#d3",
        "4" : "#d4",    "5" : "#d5",       "6" : "#d6",
        "7" : "#d7",    "8" : "#d8",       "9" : "#d9",
        "Delete" : "#delete",       "*" : "#multiply",
        "/" : "#divide",            "-" : "#subtract",
        "+" : "#add",               "=" : "#equal",
        "Backspace" : "#delete",    "Enter" : "#equal",
        "_" : "#negative"
      };

$(document).ready(function(){
  $(document).keydown(function(e){
    key = e.key;
    switch (key) {
      case key:
        $(dict[key]).click();
        break;
    }
  });
});

function displayLimit(){
  if (displayVal.length > 20) {
    displayVal = displayVal.slice(0,21);
    input = input.slice(0,21);
  }

  screenDisplay.innerHTML = displayVal;
}

function clearScreen() {
  displayVal = "";
  input = "";
  screenDisplay.innerHTML = displayVal;
};

function deleteInput() {
  displayVal = displayVal.slice(0,-1);
  screenDisplay.innerHTML = displayVal;
  switch (input.substr(-1)) {
    case "+":
    case "-":
    case "*":
    case "/":
    case " ":
      input = input.slice(0,-3);
      break;
    default:
      input = input.slice(0,-1);
  };
};

function negative() {
  displayVal +=  '-';
  input += "-";
  screenDisplay.innerHTML = displayVal;
}


function multiply() {
  displayVal += 'x';
  input += " * ";
  screenDisplay.innerHTML = displayVal;
  decimalCount = 0;
};

function divide() {
  displayVal += '÷';
  input += " / ";
  screenDisplay.innerHTML = displayVal;
  decimalCount = 0;
};

function subtract() {
  displayVal += '-';
  input += " - ";
  screenDisplay.innerHTML = displayVal;
  decimalCount = 0;
};

function add() {
  displayVal += '+';
  input += " + ";
  screenDisplay.innerHTML = displayVal;
  decimalCount = 0;

};

decimalCount = 0;
function inputDecimal() {
  if (decimalCount == 0){
    decimalCount += 1;
    displayVal += ".";
    screenDisplay.innerHTML = displayVal;
    input += ".";
  };
};

function inputDigit(val) {
  displayVal += val;
  input += val;
  screenDisplay.innerHTML = displayVal;
};

function rounding(num){
  num = num.toString();
  if (num.includes(".")){
    var index = num.indexOf("0");
  }
}

function doMultiplying(array){
  while (array.includes("*")) {
    index = array.findIndex(element => element == "*");
    var multiplier = 10000000; //to overcome multiplication error with floats
    a = array[index-1] * multiplier;
    b = array[index+1] * multiplier;
    value = (a * b) / (multiplier ** 2 );
    array.splice((index-1), 3, value);
    console.log(array);
  };
}

function doDividing(array){
  while (array.includes("/")){
  index = array.findIndex(element => element == "/");
  value = (array[index-1] / array[index+1]);
  array.splice((index-1), 3, value);
  console.log(array);
  };
}

function doSubtracting(array){
  while (array.includes("-")){
  index = array.findIndex(element => element == "-");
  value = parseFloat(array[index-1]) - parseFloat(array[index+1]);
  array.splice((index-1), 3, value);
  console.log(array);
  };
}

function doAdding(array) {
  while (array.includes("+")){
  index = array.findIndex(element => element == "+");
  value = parseFloat(array[index-1]) + parseFloat(array[index+1]);
  array.splice((index-1), 3, value);
  console.log(array);
  };
}

function operate() {
  var array = input.split(" ");

  if (array.includes("*")) {
    if (array.includes("/") && (
    array.findIndex(element => element == "*") <
    array.findIndex(element => element == "/")) ){
      doMultiplying(array);
    }else{
      doDividing(array);
    };
    doMultiplying(array);
  };


  if (array.includes("/")){
    doDividing(array);
  }

  if (array.includes("-")){
    doSubtracting(array);
  }

  if (array.includes("+")){
    doAdding(array);
  }

  if (array == "NaN"){
    array = "Syntax Error";
  }
  else if (array == "Infinity"){
    array = "Math Error"
  };

  displayVal = array;
  screenDisplay.innerHTML = displayVal;

  input = array;
};
