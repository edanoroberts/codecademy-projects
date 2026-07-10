let myAge = 25
//myAge is set to a let variable as my age can change//

let earlyYears = 2
//earlyYears is set as a let variable as this variable needs to be interchangeable//
earlyYears *= 10.5

let laterYears = myAge - 2
//laterYears is set as a let variable as this will chnge when earlyYears is changed//

laterYears *= 4
//using the '*=' operator allows the laterYears varibale to be multiplied and assigned in one step//

let myAgeInDogYears = earlyYears + laterYears
//myAgeInDogYears is calculated by adding the early and later years together using. the '+' operator

const myName = 'Edan'.toLowerCase()
//myName is a const variable as it is not going to change and '.toLowerCase()' sets the name to lower case//

console.log(`My name is ${myName}. I am ${myAge} years old in human years, which is ${myAgeInDogYears} years old in dog years.`)
//This string interpolates multiple variables into one string to deliver the variable results in an easier to read format//
