import Cocoa

// greetUser
func greetUser() {
    print("Hi there!")
}
greetUser()

var greetCopy = greetUser
greetCopy()

// Hello
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
sayHello("Taylor")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// Team
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)


func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeam)

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

let reverseTeam = team.sorted {
    return $0 > $1
}

let reverseTeam2 = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// Size
let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26:
        return "XS"
    case 27...30:
        return "S"
    case 31...34:
        return "M"
    case 35...38:
        return "L"
    default:
        return "XL"
    }
}
print (measureSize(36))

var buyMagazine = { (name: String) -> Int in
    let amount = 10
    print("\(name) costs \(amount)")
    return amount
}
buyMagazine("Wired")

// fill array
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

// multiple function as data
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}
makeCake {
    print("Mix egg and flour")
}

func brewTea(steps: () -> Void) {
    print("Get tea")
    print("Get milk")
    print("Get sugar")
    steps()
}
brewTea {
    print("Brew tea in teapot.")
    print("Add milk to cup")
    print("Pour tea into cup")
    print("Add sugar to taste.")
}


func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}


//Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }   // filter out even numbers
    .sorted()                           // sort the odd numbers
    .map { print ("\($0) is a lucky number.") } // map to strings


//func removeFromArray(for massiv: Array<Any>) -> Array<Any> {
//    var result = []
//    var i = 0
//    for i in massiv {
//        if i %2 == 0 {
//        } else {
//            result.append(i)
//        }
//        i += 1
//    }
//    
//        
//}

// map
let numbers = [1, 2, 3, 4]
let doubled = numbers.map { $0 * 2 }
print(doubled)

let strings = ["John", "Paul", "George", "Ringo"]
let uppercased = strings.map { $0.uppercased() }

// filtered
let words = ["Hello", "This", "Is", "Nothing", "But", "A", "Test"]
let filtered = words.filter { !($0.count < 4) }
print(filtered)

// isMultiple
let data2 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
print ( data2.filter { $0.isMultiple(of: 2) } )
