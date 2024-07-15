import Cocoa

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

let people = "haters"
let action = "hate"
let lyrics = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
let missionMessage = "Apoloo " + String(number) + " landed on the Moon."
print(missionMessage)

let missionMessage2 = "Apoloo \(number) landed on the Moon."
print(missionMessage2)

print("5 x 5 is \(5 * 5)")
