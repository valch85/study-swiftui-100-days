import Cocoa


// How to handle missing data with optionals

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

// Unwrapping optionals Question 5/12 Answer: false
// This attempts to compare an optional Double against 85, which is not possible.
let tableHeight: Double? = 100
if let tableHeight = tableHeight {
    if tableHeight > 85.0 {
        print("The table is too high.")
    }
}
// Unwrapping optionals Question 6/12 Answer: true
let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}
// Unwrapping optionals Question 12/12 Answer: false
// This attempts to compare an optional Int against 100, which is not possible.
var bestScore: Int? = nil
bestScore = 101
if let bestScore = bestScore {
    if bestScore > 100 {
        print("You got a high score!")
    } else {
        print("Better luck next time.")
    }
}


//How to unwrap optionals with guard
