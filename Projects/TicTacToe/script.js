const playerScore = document.querySelector("#playerScoreCount");
const compScore = document.querySelector("#compScoreCount");
const scoreboard = document.querySelector(".scoreboard");
const gameboard = document.querySelector(".gameboard");
const cells = document.querySelectorAll(".cell");
const homepage = document.querySelector(".homepage");
const play = document.querySelector(".play");
const player1 = document.querySelector("#player1");
const player2 = document.querySelector("#player2");

play.style.display = "none";

let playerScoreCount = 0;
let compScoreCount = 0;

let gameTurns = 0;
let cellUsed = [];
let computerTurn = true;
let winCount = 0;
let stopGame = false;
let compHard = false;
let compGod = false;

game = {
  array : ["","","","","","","","",""],
  player_X : { name : "X", symbol : "X" },
  player_O : { name : "O", symbol : "O" }
}

function addName(){
  game.player_X.name = player1.value;
  game.player_O.name = player2.value;
  alert("Name(s) added succesfully! Please select a game mode to play.");
}

function againstHuman(){
  homepage.style.display = "none";
  play.style.display = "block";
  comp = false;
  resetScore();
  nextRound();
  playAgainstHuman();
}

function againstCompEasy(){
  homepage.style.display = "none";
  play.style.display = "block";
  comp = true;
  resetScore();
  nextRound();
  playAgainstCompEasy();
}

function againstCompHard(){
  homepage.style.display = "none";
  play.style.display = "block";
  comp = true;
  compHard = true;
  resetScore();
  nextRound();
  playAgainstCompHard();
}

function againstCompGod(){
  homepage.style.display = "none";
  play.style.display = "block";
  comp = true;
  compGod = true;
  resetScore();
  nextRound();
  playAgainstCompGod();
}


function main(){
  homepage.style.display = "block";
  play.style.display = "none";
  comp = false;
  compHard = false;
  compGod = false;
}


function setGame() {
  for (let i=0; i<9; i++) {
    let cell = document.createElement("div");
    cell.setAttribute("id", 'cell-'+i);
    cell.className = "cell";
    gameboard.appendChild(cell);
  }
}

function nextRound() {
  while (gameboard.hasChildNodes()){
      gameboard.removeChild(gameboard.firstChild);
    };
  gameTurns = 0;
  cellUsed = [];
  game.array = ["","","","","","","","",""];
  stopGame = false;
  setGame();
  if (comp && !compHard && !compGod) {
    playAgainstCompEasy();
  } else if(comp && compHard && !compGod) {
    playAgainstCompHard();
  } else if(comp && !compHard && compGod) {
    playAgainstCompGod();
  } else {
    playAgainstHuman();
  }
}

function resetScore() {
  playerScoreCount = 0;
  compScoreCount = 0;
  playerScore.innerHTML = playerScoreCount;
  compScore.innerHTML = compScoreCount;
}

function playAgainstHuman(){
  for (let i=0; i<9; i++){
    let currentCell = document.querySelector("#cell-" + i);
    currentCell.addEventListener("click", function(){
      if (!(cellUsed.includes(i)) && !stopGame) {
        if (gameTurns % 2 == 0){
          this.innerHTML = game.player_X.symbol;
          game.array[i] = game.player_X.symbol;
          cellUsed.push(i);
          gameTurns += 1;
          checkWinner();
        } else {
          this.innerHTML = game.player_O.symbol;
          game.array[i] = game.player_O.symbol;
          cellUsed.push(i);
          gameTurns += 1;
          checkWinner();
        }
      };
    });
  }
}

function playAgainstCompEasy(){
  for (let i=0; i<9; i++){
    let currentCell = document.querySelector("#cell-" + i);
    currentCell.addEventListener("click", function(){
      if (!(cellUsed.includes(i)) && !stopGame) {
        this.innerHTML = game.player_X.symbol;
        game.array[i] = game.player_X.symbol;
        cellUsed.push(i);
        gameTurns += 1;
        computerTurn = true;
        checkWinner();
        if (computerTurn){
          computerPlayEasy();
        }
      }
    });
  }
}

function playAgainstCompHard(){
  for (let i=0; i<9; i++){
    let currentCell = document.querySelector("#cell-" + i);
    currentCell.addEventListener("click", function(){
      if (!(cellUsed.includes(i)) && !stopGame) {
        this.innerHTML = game.player_X.symbol;
        game.array[i] = game.player_X.symbol;
        cellUsed.push(i);
        gameTurns += 1;
        computerTurn = true;
        checkWinner();
        if (computerTurn){
          computerPlayHard();
        };
      }
    });
  }
}

function playAgainstCompGod(){
  for (let i=0; i<9; i++){
    let currentCell = document.querySelector("#cell-" + i);
    currentCell.addEventListener("click", function(){
      if (!(cellUsed.includes(i)) && !stopGame) {
        this.innerHTML = game.player_X.symbol;
        game.array[i] = game.player_X.symbol;
        cellUsed.push(i);
        gameTurns += 1;
        computerTurn = true;
        checkWinner();
        if (computerTurn){
          computerPlayGod();
        };
      }
    });
  }
}

const winCombo = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
];

function checkWinner(){
  indices_X = [];
  indices_O = [];
  for (i=0; i<game.array.length; i++){
    if (game.array[i] == "X"){
      indices_X.push(i);
    }else if (game.array[i] == "O"){
      indices_O.push(i);
    };
  };

  if (indices_X.length >= 3){
    function checkSubsetX(val) {
      return indices_X.indexOf(val) >= 0;
    };
    winCount = 0;
    for (let combo of winCombo){
      foundWinner = combo.every(checkSubsetX);
      if (foundWinner && winCount == 0){
        alert(game.player_X.name + " wins this round!");
        playerScoreCount += 1;
        playerScore.innerHTML = playerScoreCount;
        computerTurn = false;
        winCount += 1;
        stopGame = true;
      }
    }
  }
  if (indices_O.length >= 3){
    function checkSubsetO(val) {
      return indices_O.indexOf(val) >= 0;
    };
    for (let combo of winCombo){
      foundWinner = combo.every(checkSubsetO);
      if (foundWinner && winCount == 0){
        alert(game.player_O.name + " wins this round!");
        compScoreCount += 1;
        compScore.innerHTML = compScoreCount;
        computerTurn = false;
        winCount += 1;
        stopGame = true;
      }
    }
  };

  if (cellUsed.length == 9 && winCount == 0){
    alert("Tie Game!");
    computerTurn = false;
  }

  if (playerScoreCount == 5) {
    alert("Congratulations!!! You are the winner! Well Done " +
    game.player_X.name + "!")
  }

  if (compScoreCount == 5 && comp) {
    alert("Unlucky! Better luck next time! Thank you "+game.player_X.name+ " for playing!")
  } else if (compScoreCount == 5 && !comp){
    alert("Congratulations!!! You are the winner! Well Done " +
    game.player_O.name + "!")
  }
}


function computerPlayEasy(){
  if (gameTurns < 9 && computerTurn == true) {
    let index = Math.round(Math.random()*8);
    if (cellUsed.includes(index)){
      while (cellUsed.includes(index)) {
        index = Math.round(Math.random()*8);
      }
    };
    console.log("easy "+index);
    game.array[index] = game.player_O.symbol;
    let currentCell = document.querySelector("#cell-" + index);
    currentCell.innerHTML = game.player_O.symbol;
    cellUsed.push(index);
    gameTurns += 1;
  };
  checkWinner();
}

function computerPlayHard(){
      if (gameTurns < 9 && computerTurn == true) {
        if (indices_O.includes(0) && indices_O.includes(1) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(0) && indices_O.includes(3) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_O.includes(0) && indices_O.includes(4) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(1) && indices_O.includes(2) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(1) && indices_O.includes(4) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_O.includes(2) && indices_O.includes(4) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_O.includes(2) && indices_O.includes(5) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(3) && indices_O.includes(4) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_O.includes(4) && indices_O.includes(5) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_O.includes(4) && indices_O.includes(6) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(4) && indices_O.includes(7) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_O.includes(4) && indices_O.includes(8) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(5) && indices_O.includes(8) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(6) && indices_O.includes(7) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(6) && indices_O.includes(3) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(7) && indices_O.includes(8) && !cellUsed.includes(6)) {
          index = 6;
        }


        else if (indices_X.includes(0) && indices_X.includes(1) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(0) && indices_X.includes(3) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_X.includes(0) && indices_X.includes(4) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(1) && indices_X.includes(2) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(1) && indices_X.includes(4) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_X.includes(2) && indices_X.includes(4) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_X.includes(2) && indices_X.includes(5) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(3) && indices_X.includes(4) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_X.includes(4) && indices_X.includes(5) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_X.includes(4) && indices_X.includes(6) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(4) && indices_X.includes(7) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_X.includes(4) && indices_X.includes(8) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(5) && indices_X.includes(8) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(6) && indices_X.includes(7) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(6) && indices_X.includes(3) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(7) && indices_X.includes(8) && !cellUsed.includes(6)) {
          index = 6;
        }
        else {
        index = Math.round(Math.random()*8);
        if (cellUsed.includes(index)){
          while (cellUsed.includes(index)) {
            index = Math.round(Math.random()*8);
          }
        };
      }

    console.log("hard "+index);
    game.array[index] = game.player_O.symbol;
    let currentCell = document.querySelector("#cell-" + index);
    currentCell.innerHTML = game.player_O.symbol;
    cellUsed.push(index);
    gameTurns += 1;
  };
    checkWinner();
}

function computerPlayGod(){
  if (gameTurns < 9 && computerTurn == true) {
        if (!indices_X.includes(4) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_X.includes(4) && cellUsed.length == 1) {
          index = 2;
        }
        else if (indices_X.includes(4) && indices_X.includes(6) && cellUsed.length == 3){
          index = 8;
        }

        else if (indices_O.includes(0) && indices_O.includes(1) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(1) && indices_O.includes(2) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(2) && indices_O.includes(0) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_O.includes(3) && indices_O.includes(4) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_O.includes(4) && indices_O.includes(5) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_O.includes(5) && indices_O.includes(3) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_O.includes(6) && indices_O.includes(7) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(7) && indices_O.includes(8) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_O.includes(8) && indices_O.includes(6) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_O.includes(0) && indices_O.includes(3) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_O.includes(3) && indices_O.includes(6) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(6) && indices_O.includes(0) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_O.includes(1) && indices_O.includes(4) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_O.includes(4) && indices_O.includes(7) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_O.includes(7) && indices_O.includes(1) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_O.includes(2) && indices_O.includes(5) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(5) && indices_O.includes(8) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(8) && indices_O.includes(2) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_O.includes(0) && indices_O.includes(4) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_O.includes(4) && indices_O.includes(8) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_O.includes(8) && indices_O.includes(0) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_O.includes(2) && indices_O.includes(4) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_O.includes(4) && indices_O.includes(6) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_O.includes(6) && indices_O.includes(2) && !cellUsed.includes(4)) {
          index = 4;
        }


        else if (indices_X.includes(0) && indices_X.includes(1) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(1) && indices_X.includes(2) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(2) && indices_X.includes(0) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_X.includes(3) && indices_X.includes(4) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_X.includes(4) && indices_X.includes(5) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_X.includes(5) && indices_X.includes(3) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_X.includes(6) && indices_X.includes(7) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(7) && indices_X.includes(8) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_X.includes(8) && indices_X.includes(6) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_X.includes(0) && indices_X.includes(3) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_X.includes(3) && indices_X.includes(6) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(6) && indices_X.includes(0) && !cellUsed.includes(3)) {
          index = 3;
        }
        else if (indices_X.includes(1) && indices_X.includes(4) && !cellUsed.includes(7)) {
          index = 7;
        }
        else if (indices_X.includes(4) && indices_X.includes(7) && !cellUsed.includes(1)) {
          index = 1;
        }
        else if (indices_X.includes(7) && indices_X.includes(1) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_X.includes(2) && indices_X.includes(5) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(5) && indices_X.includes(8) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(8) && indices_X.includes(2) && !cellUsed.includes(5)) {
          index = 5;
        }
        else if (indices_X.includes(0) && indices_X.includes(4) && !cellUsed.includes(8)) {
          index = 8;
        }
        else if (indices_X.includes(4) && indices_X.includes(8) && !cellUsed.includes(0)) {
          index = 0;
        }
        else if (indices_X.includes(8) && indices_X.includes(0) && !cellUsed.includes(4)) {
          index = 4;
        }
        else if (indices_X.includes(2) && indices_X.includes(4) && !cellUsed.includes(6)) {
          index = 6;
        }
        else if (indices_X.includes(4) && indices_X.includes(6) && !cellUsed.includes(2)) {
          index = 2;
        }
        else if (indices_X.includes(6) && indices_X.includes(2) && !cellUsed.includes(4)) {
          index = 4;
        }

        else {
        index = Math.round(Math.random()*8);
        if (cellUsed.includes(index)){
          while (cellUsed.includes(index)) {
            index = Math.round(Math.random()*8);
          }
        };
      }

    console.log("hard "+index);
    game.array[index] = game.player_O.symbol;
    let currentCell = document.querySelector("#cell-" + index);
    currentCell.innerHTML = game.player_O.symbol;
    cellUsed.push(index);
    gameTurns += 1;
  };
    checkWinner();
}
