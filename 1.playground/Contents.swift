import Cocoa

var greeting = "Hello, playground"
var name = "Ted"
name = "Rebecca"
name = "Keeley"
let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

let actor = """
A day in
Denzel washington.jpg \".
line 2 line 2
line 3
"""
let filename = "paris.jpg"
print(actor.count)

let nameLength = actor.count
print(nameLength)
print(actor.uppercased())

print(actor.hasPrefix("a day"))
print(filename.hasSuffix(".jpg"))

let score = 10
let reallyBig = 100_000_000
print(reallyBig)

let lowerScore = score - 2
let higherScore = score + 10
let boubleScore = score * 2
let squaredScore =  score * score
let halvedScore = score / 2

var counter = 10
//counter = counetr + 5
counter += 5
print(counter)
//print("test4")
counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
