import Cocoa

let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}



// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
//1
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("var 1 Welcome, \(username)!")

//2
if username.count == 0 {
    username = "Anonymous"
}
print("var 2 Welcome, \(username)!")

//3
if username.isEmpty == true {
    username = "Anonymous"
}
print("var 3 Welcome, \(username)!")

//4
if username.isEmpty {
    username = "Anonymous"
}
print("var 4 Welcome, \(username)!")


let age2 = 16

if age2 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent == true {
    print ("You can buy a game")
}

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}


enum TransportOption {
    case airplane, helicopter, car, bicycle, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print ("Let's fly")
} else if transport == .bicycle {
    print ("I hope there's a bike path...")
} else if transport == .car {
    print ("Time to get stuck in traffic.")
} else {
    print ("I am going to hire a scooter!")
}

//SWITCH

enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun

switch forecast {
case .sun:
    print("sun")
case .rain:
    print("rain")
case .wind:
    print("wind")
case .snow:
    print("snow")
case .unknown:
    print("kaput")
}

let place = "Metropolis"

switch place {
case "Gotham":
    print ("You are Batman!")
case "Mega-City One":
    print ("You are Judge Dredd")
default:
    print ("Who are you?")
}


let day = 5
print ("My true love gave to me")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 trutle doves")
    fallthrough
default:
    print("a partridge in a pear tree")
}


// ternary conditional operator

let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"

let hour2 = 23
print(hour2 < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

let hour3 = 23
print(hour3 < 12 ? "It's before noon" : "It's after noon")

//will not work cause incide of the "print"
print(
    if hour3 < 12 {
        "It's before noon"
    } else {
        "It's after noon"
    }
)

if hour3 < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}

















