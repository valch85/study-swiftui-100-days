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
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

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

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
                vacationAllocated - vacationTaken
        }

        set {
                vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer2 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer2.vacationTaken += 4
archer2.vacationRemaining = 5
print(archer2.vacationAllocated)


