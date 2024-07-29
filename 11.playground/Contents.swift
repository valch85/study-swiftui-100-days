import Cocoa

//Structs, part two
// limit access to internal data
struct BankAccount {
    private(set) var funds = 0
    //private var funds = 0
    //var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
//account.funds -= 1000
print (account.funds)
 
// TEST Access control 6/12
struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    init(name: String, location: String) {
        self.name = name
        self.location = location
        //self.currentPatient = "No one"
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")
print("-> drJones is \(drJones)")

// TEST Access control 7/12
struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])
print("-> monmouthStreet is \(monmouthStreet)")

// TEST Access control 8/12
struct RebelBase {
    private var location: String
    private var peopleCount: Int
    init(location: String, people: Int) {
        self.location = location
        self.peopleCount = people
    }
}
let base = RebelBase(location: "Yavin", people: 1000)
print("-> base is \(base)")

// TEST Access control 9/12
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])
print("-> royalHigh is \(royalHigh)")

// TEST Access control 10/12
struct Customer {
    var name: String
    private var creditCardNumber: Int
    init(name: String, creditCard: Int) {
        self.name = name
        self.creditCardNumber = creditCard
    }
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)
print("-> lottie is \(lottie)")

// TEST Access control 12/12
struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")
print("-> spotify is \(spotify)")

//Static properties and methods

