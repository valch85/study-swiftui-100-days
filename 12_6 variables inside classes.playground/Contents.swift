import Cocoa

// How to work with variables inside classes

// Constant property, constant instance – a signpost that always points to the same user, who always has the same name.
/*
class User1 {
    let name1 = "Paul"
}

let user1 = User1()
user1.name1 = "Taylor"
print(user1.name1)
*/
// Constant property, variable instance – a signpost that always points to the same user, but their name can change.
class User2 {
    var name2 = "Paul"
}

let user2 = User2()
user2.name2 = "Taylor"
print(user2.name2)

// Variable property, constant instance – a signpost that can point to different users, but their names never change.
/*
class User3 {
    let name3 = "Paul"
}

var user3 = User3()
user3.name3 = "Taylor"
user3 = User3()
print(user3.name3)
*/
// Variable property, variable instance – a signpost that can point to different users, and those users can also change their names.
class User4 {
    var name4 = "Paul"
}

var user4 = User4()
user4.name4 = "Taylor"
user4 = User4()
print(user4.name4)


// Mutability Question 1/12 Answer: true
class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")
// Mutability Question 2/12 Answer: false
class School {
    //Correct! The students property has been marked as a constant, so it can't be modified.
    //let students = 200
    var students = 200
    func expel(student: String, for reason: String) {
        print("\(student) has been expelled for \(reason).")
        students -= 1
    }
}
let school = School()
school.expel(student: "Jason", for: "coding during class")
// Mutability Question 3/12 Answer: false
class SewingMachine {
    var itemsMade = 0
    //Correct! The mutating keyword is not allowed with classes.
    //mutating func makeBag(count: Int) {
    func makeBag(count: Int) {
        itemsMade += count
    }
}
var machine = SewingMachine()
machine.makeBag(count: 1)
// Mutability Question 4/12 Answer: false
struct Park {
    var numberOfFlowers = 1000
    // Oops – that's not correct. The plantFlowers() method attempts to modify the numberOfFlowers property, but it isn't marked as mutating.
    //func plantFlowers() {
    mutating func plantFlowers() {
        numberOfFlowers += 50
    }
}
//let park = Park()
var park = Park()
park.plantFlowers()
// Mutability Question 5/12 Answer: false
struct Piano {
    var untunedKeys = 3
    //Correct! The tune() method attempts to modify the untunedKeys property, but it isn't marked as mutating.
    //func tune() {
    mutating func tune() {
        if untunedKeys > 0 {
            untunedKeys -= 1
        }
    }
}
var piano = Piano()
piano.tune()
// Mutability Question 6/12 Answer: false
class Beach {
    var lifeguards = 10
    // Correct! The mutating keyword is not allowed with classes.
    //mutating func addLifeguards(count: Int) {
    func addLifeguards(count: Int) {
        lifeguards += count
    }
}
var beach = Beach()
beach.addLifeguards(count: 2)
// Mutability Question 7/12 Answer: false
struct Kindergarten {
    var numberOfScreamingKids = 30
    mutating func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
// This attempts to call a mutating method on a constant struct instance.
//let kindergarten = Kindergarten()
var kindergarten = Kindergarten()
kindergarten.handOutIceCream()
// Mutability Question 8/12 Answer: true
class Light {
    var onState = false
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}
let light = Light()
light.toggle()
// Mutability Question 9/12 Answer: true
struct Code {
    var numberOfBugs = 100
    mutating func fixBug() {
        numberOfBugs += 3
    }
}
var code = Code()
code.fixBug()
// Mutability Question 10/12 Answer: true
class Phasers {
    var energyLevel = 100
    func firePhasers() {
        if energyLevel > 10 {
            print("Firing!")
            energyLevel -= 10
        }
    }
}
var phasers = Phasers()
phasers.firePhasers()
// Mutability Question 11/12 Answer: true
class Sun {
    var isNova = false
    func goNova() {
        isNova = true
    }
}
let sun = Sun()
sun.goNova()
// Mutability Question 12/12 Answer: true
struct Barbecue {
    var charcoalBricks = 20
    mutating func addBricks(_ number: Int) {
        charcoalBricks += number
    }
}
var barbecue = Barbecue()
barbecue.addBricks(4)
