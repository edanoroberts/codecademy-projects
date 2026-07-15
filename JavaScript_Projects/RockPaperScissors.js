const getUserChoice = (userInput) => {
  userInput = userInput.toLowerCase();
  if (
    userInput === "bomb" ||
    userInput === "rock" ||
    userInput === "paper" ||
    userInput === "scissors"
  ) {
    return userInput;
  } else {
    console.log("Ain't gonna fly chief");
  }
};
const getComputerChoice = () => {
  value = Math.floor(Math.random() * 3);
  if (value === 0) {
    return "rock";
  } else if (value === 1) {
    return "paper";
  } else if (value === 2) {
    return "scissors";
  }
};

const determineWinner = (userChoice, computerChoice) => {
  if (userChoice === "bomb") {
    return "You win, you sneaky bugger!";
  }
  if (userChoice === computerChoice) {
    return "This one is a draw";
  }
  if (userChoice === "rock") {
    if (computerChoice === "paper") {
      return "Computer wins!";
    } else {
      return "You win!";
    }
  }
  if (userChoice === "paper") {
    if (computerChoice === "scissors") {
      return "Computer wins!";
    } else {
      return "You win!";
    }
  }
  if (userChoice === "scissors") {
    if (computerChoice === "rock") {
      return "Computer wins!";
    } else {
      return "You win!";
    }
  }
};

function playGame() {
  const userChoice = getUserChoice("paper");
  if (!userChoice) return;
  console.log(`You throw: ${userChoice}`);
  const computerChoice = getComputerChoice();
  console.log(`The computer throws: ${computerChoice}`);
  console.log(determineWinner(userChoice, computerChoice));
}

playGame();
