import Cocoa

// How to use opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// How to create and use extensions
var quote = "   The truth is rarely pure and never simple   "
//let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
let trimmed = quote.trimmed()
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


// Notice how the method has slightly different naming now: when we return a new value we used trimmed(), but when we modified the string directly we used trim(). This is intentional, and is part of Swift’s design guidelines: if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().

/*
mutating func trim() {
    self = self.trimmed()
}

func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
*/

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
print(lotr)
let lotr2 = Book(title: "Lord of the Rings", pageCount: 1178)
print(lotr2)

// Extensions Question 6/12 Answer: false
// This computed property doesn't actually return a value.
extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        return(self == target)
    }
}
print(42.isAnswerToLifeUniverseAndEverything)
// Extensions Question 7/12 Answer: false
// if self = true should read if self == true.
extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}

//How to create and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}



protocol Person {
    var name: String { get }
    func sayHello()
}
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    var name: String
}

let piter = Employee(name: "Piter")
piter.sayHello()

// Protocol extensions Question 5/12 Answer: true
protocol Anime {
    var availableLanguages: [String] { get set }
    func watch(in language: String)
}
extension Anime {
    func watch(in language: String) {
        if availableLanguages.contains(language) {
            print("Now playing in \(language)")
        } else {
            print("Unrecognized language.")
        }
    }
}


// Checkpoint 8

protocol Building {
    var rooms: Int {get set}
    var cost: Int {get set}
    var nameEstateAgent: String {get set}
    func salesSummary()
}

extension Building {
    func salesSummary(){
        var price: Int
        price = cost * 2
        print("Tottal sum to sale is \(price). Call \(nameEstateAgent) to buy it.")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var nameEstateAgent: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var nameEstateAgent: String
}

let houseOfRose = House(rooms: 5, cost: 350000, nameEstateAgent: "Linus Torvalds")
let arzingerOffice = Office(rooms: 12, cost: 1200000, nameEstateAgent: "Bill Gates")
houseOfRose.salesSummary()
arzingerOffice.salesSummary()
