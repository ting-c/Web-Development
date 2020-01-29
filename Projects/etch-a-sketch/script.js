const container = document.querySelector(".container");
const cell = document.querySelector(".cell");

var rows = 16; //default grid = 16x16
var cols = 16;


function makeGrid(rows, cols){
  container.style.setProperty("--rows", rows);
  container.style.setProperty("--cols", cols);
  for (i=0; i < (rows * cols); i++){
    let cell = document.createElement("div");
    container.appendChild(cell).className = "cell";
    container.appendChild(cell).id = i+1;
  };
};

function modifyCell() {
  $(document).ready(function() {
    $(".cell").on("mousedown", function() {
      radioValue = $('input[type=radio]:checked').val();
      canDrag = true;
      $(this).removeClass("cell cell-black cell-white cell-red cell-pink cell-yellow cell-green cell-blue cell-violet cell-purple cell-undo")
      .addClass("cell-" + radioValue);
      $(".cell").on("mousemove", function() {
      if (canDrag == true) {
        $(this).removeClass("cell cell-black cell-white cell-red cell-pink cell-yellow cell-green cell-blue cell-violet cell-purple cell-undo")
        .addClass("cell-" + radioValue);
      };
      });
    });
    $(".cell").on("mouseup", function() {
      canDrag = false;
    });
  });
};

function reset() {
  $(document).ready(function(){
  while (container.firstChild) {
    container.firstChild.remove();
  };
  makeGrid(rows, cols);
  modifyCell();
  });
};

function resetGrid() {
  rows = prompt('Enter a number for grid size. (min = 1, max = 50)');
  cols = rows;
  $(document).ready(function(){
  while (container.firstChild) {
    container.firstChild.remove();
  };
  makeGrid(rows, cols);
  modifyCell();
  });
};


makeGrid(rows, cols);
modifyCell();
