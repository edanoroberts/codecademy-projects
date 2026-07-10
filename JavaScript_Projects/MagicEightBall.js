let userName = "";
userName ? console.log(`Hello, ${userName}!`) : console.log(`Hello!`);

let userQuestion = "";
userQuestion
  ? console.log(`${userName} asks: ${userQuestion}`)
  : console.log(`What knowledge do you require?`);

let randomNumber = Math.floor(Math.random() * 8);

let eightBall = "";
if (userQuestion)
  switch (randomNumber) {
    case 0:
      eightBall = `It's written in the stars`;
      break;
    case 1:
      eightBall = `It is certain`;
      break;
    case 2:
      eightBall = `It is decidedly so`;
      break;
    case 3:
      eightBall = `Reply hazy try again`;
      break;
    case 4:
      eightBall = `Cannot predict now`;
      break;
    case 5:
      eightBall = `Do not count on it`;
      break;
    case 6:
      eightBall = `My sources say no`;
      break;
    case 7:
      eightBall = `Outlook not so good`;
      break;
    default:
      console.log(`There is a tear in the fabric of reality`);
      break;
  }
console.log(eightBall);

