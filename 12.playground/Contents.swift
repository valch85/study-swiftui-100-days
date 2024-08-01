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
