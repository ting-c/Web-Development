var playerScore = 0;
var computerScore = 0;
const playerScore_span = document.getElementById("playerScore");
const computerScore_span = document.getElementById("computerScore");
const scoreboard_div = document.querySelector(".scoreboard");
const message_p = document.querySelector(".message > p");
const rock_div = document.getElementById("rock");
const paper_div = document.getElementById("paper");
const scissors_div = document.getElementById("scissors");



function computerPlay(){
  var outcomes = ["Rock", "Paper", "Scissors"]
  //Math.floor returns the largest integer less than or equal to a given number.
  //Math.random returns a float between 0 - 1
  var choice = outcomes[Math.floor(Math.random()*outcomes.length)];
  return choice
}

function playRound(playerSelection, computerSelection){

  if (playerSelection ==  computerSelection){
    message_p.innerHTML = "Draw!";


  }
  else if (  (playerSelection == "Rock" && computerSelection == "Scissors")
              || (playerSelection == "Paper" && computerSelection == "Rock")
              || (playerSelection == "Scissors" && computerSelection == "Paper")
              ){
                playerScore += 1;
                playerScore_span.innerHTML = playerScore;
                message_p.innerHTML =  "You win! " + playerSelection + " beats " + computerSelection + "."

            }
  else {  computerScore += 1;
          computerScore_span.innerHTML = computerScore;
            message_p.innerHTML = "Computer win! " + computerSelection + " beats " + playerSelection + "."
        }
  }

// To play a 5 round game
function game(playerSelection){
  player_vs_comp = 0
  var computerSelection = computerPlay()
  playRound(playerSelection, computerSelection);

}

function main() {
  rock_div.addEventListener('click',  function() {
    game('Rock');
  })
  paper_div.addEventListener('click', function() {
    game('Paper');
  })

  scissors_div.addEventListener('click', function() {
    game('Scissors');
  })


}

main();
