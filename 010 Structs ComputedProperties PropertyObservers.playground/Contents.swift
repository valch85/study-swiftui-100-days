import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//Back to the future
struct Delorean {
    var speed = 0
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}
print("+++++++")

struct Employee {
    //let name: String = "Anonymous"
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation")
            print("Days remaning \(vacationRemaining) ")
        } else {
            print("Oops! No days remaning.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//var archer = Employee(vacationRemaining: 14)
archer.takeVacation(days: 5)
print("Archer vac remaning \(archer.vacationRemaining)")

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)


print("+++++++")

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int { // отпука отсалось
        get {
                vacationAllocated - vacationTaken
            // отпуска выделено - отпуска взято
        }

        set {
                vacationAllocated = vacationTaken + newValue
            // отпуска выделено = отпуска взято + новая величина
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print("this answer \(archer2.vacationAllocated)")

// 3 How to take action when a property changes
// Game
struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1


print("+++++++")


struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game2 = Game2()
game2.score += 10
game2.score -= 3
game2.score += 1


print("+++++++")


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
app.contacts.append("Valentyn Ch")


// Сustom initializers
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
