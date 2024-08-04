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


// How to unwrap optionals with guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

/*
guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}
*/

// Unwrapping with guard Question 7/12 Answer: false
// The number parameter is not optional, so we can't use guard let to unwrap it.
func add3(to number: Int?) -> Int {
    guard let number = number else {
        return 3
    }
    return number + 3
}
let added = add3(to: 5)
print(added)

// Unwrapping with guard Question 10/12 Answer: false
// This code acts as if username returns an optional string; it does not.
func username(for id: Int?) -> String? {
// func username(for id: Int?) -> String {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}
// Unwrapping with guard Question 12/12 Answer: false
// This should probably read guard let type else or similar.
func plantTree(_ type: String?) {
    guard let type else {
//    guard type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")

// How to unwrap optionals with nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
print(new)
let new2 = captains["Serenity", default: "N/A"]
print(new2)

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
print(tvShows.randomElement())
let favorite = tvShows.randomElement() ?? "None"
print(favorite)


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input2 = ""
let number2 = Int(input2) ?? 0
print(number2)

