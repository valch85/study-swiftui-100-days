import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is not \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Creating your own classes Question 6/12
class Image {
    var filename: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        self.filename = filename
        self.isAnimated = isAnimated
    }
}

//How to make one class inherit from another
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm developer who will sometime work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// final means that noone will inheared from this cluss more
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()
let naval = Developer(hours: 8)
naval.printSummary()
let nick = Manager(hours: 10)
nick.printSummary()


// How to add initializers for classes
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let audi = Car(isElectric: true, isConvertible: false)
print(audi)


// Class inheritance Question 2/12
class Student {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
class UniversityStudent: Student {
    var annualFees: Int
    init(name: String, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name: name)
    }
}

// Class inheritance Question 3/12
class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}
class DesignerHandbag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}


class Student2 {
    var name: String
    var test: Int
    
    init(name2: String, test: Int) {
        self.name = name2
        self.test = test
    }
}

class UniversityStudent2: Student2 {
    var annualFees: Int
    init(name2: String, test: Int, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name2: name2, test: test)
    }
}

//let vasya = UniversityStudent2(name2: "Vasya", annualFees: 10000)


struct Person {
    var name: String
    var age: Int
    
    // Default initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Custom initializer with a default age
    init(name: String) {
        self.name = name
        self.age = 0
    }
    
    // Custom initializer with no parameters
    init() {
        self.name = "Unknown"
        self.age = 0
    }
}

// Using the default initializer
let person1 = Person(name: "Alice", age: 30)

// Using the initializer with a default age
let person2 = Person(name: "Bob")

// Using the initializer with no parameters
let person3 = Person()

print(person1) // Person(name: "Alice", age: 30)
print(person2) // Person(name: "Bob", age: 0)
print(person3) // Person(name: "Unknown", age: 0)

// How to copy classes

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

print("++++++")

struct UserStruct {
    var username = "Anonymous"
}

var user3 = UserStruct()
var user4 = user3
user4.username = "Taylor"
print(user3.username)
print(user4.username)

print("++++++")

// If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.
class User2 {
    var username = "Anonymous"

    func copy() -> User2 {
        let user = User2()
        user.username = username
        return user
    }
}

var user5 = User2()
var user6 = user5.copy()
var user7 = user5.copy()
user5.username = "Nazar"
user6.username = "Taylor"
print(user5.username)
print(user6.username)
print(user7.username)


// Copying objects Question 2/12
class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)

// Copying objects Question 7/12
class Hospital {
    var onCallStaff = [String]()
}
var londonCentral = Hospital()
var londonWest = londonCentral
londonCentral.onCallStaff.append("Dr Harlan")
londonWest.onCallStaff.append("Dr Haskins")
print(londonCentral.onCallStaff)
print(londonWest.onCallStaff)

// Copying objects Question 8/12
class Ewok {
    var fluffinessPercentage = 100
}
var chirpa = Ewok()
var wicket = Ewok()
chirpa.fluffinessPercentage = 90
print(wicket.fluffinessPercentage)
print(chirpa.fluffinessPercentage)
