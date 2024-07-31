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

//Static properties and methods - properties and meterds, when they are marked as static, belong to the class (struct) and not the object that is created from it

//Count amount of students when add the name
struct School2 {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School2.add(student: "Taylor Swift")
print("studentCount \(School2.studentCount)")


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
print("\nApp Data:\n\(AppData.version)\n\(AppData.saveFilename)\n\(AppData.homeURL)")

print("++++++++")

// static property shouldn't belond to newly created user
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// get example from the stuct how to create a user
print("Example how to create a user: \n\(Employee.example)")
// will create a user but "static let example" will not added to the object
let igor = Employee(username: "Igor", password: "passw0rd")
// check that user created
print("Username: \(igor.username)\nPassword: \(igor.password)")
// try to get example from the "igor" object
//print(igor.example)

//Question 3/12
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}
let testNewStory1 = NewsStory(headline: "New Story Headline", isBreaking: true)
print(testNewStory1)
print("breakingNewsCount \(NewsStory.breakingNewsCount)\nregularNewsCount \(NewsStory.regularNewsCount)")
let testNewStory2 = NewsStory(headline: "New Story Headline", isBreaking: false)
print(testNewStory1)
print("breakingNewsCount \(NewsStory.breakingNewsCount)\nregularNewsCount \(NewsStory.regularNewsCount)")
let testNewStory2 = NewsStory(headline: "New Story Headline")
print(testNewStory1)
print("breakingNewsCount \(NewsStory.breakingNewsCount)\nregularNewsCount \(NewsStory.regularNewsCount)")
