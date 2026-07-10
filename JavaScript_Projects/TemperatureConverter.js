const kelvin = 300
//kelvin is set as a const variable as the value assigned is not going to change//

let celsius = kelvin - 273
//celsius is set as a let variable as the value will change whenever kelvin is changed//

let fahrenheit = celsius * (9/5) + 32
//fahrenheit is set to a let variable as the value will change based on the other variables and is then calculated with the appropriate formula//

fahrenheit = Math.floor(fahrenheit)
//Using the .floor method this code rounds the value of fahrenheit to a whole number//

let newton = celsius * (33/100)
newton = Math.floor(newton)

console.log(
  `The temperature is: 
  ${kelvin} kelvin
  ${fahrenheit} degrees Farenheit
  ${celsius} degrees Celsius
  ${newton} degrees Newton`
  )
