import Cocoa

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 3)
printTimesTables(for: 6)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

// This is accomplished using a default parameter value: keepingCapacity is a Boolean with the default value of false so that it does the sensible thing by default, while also leaving open the option of us passing in true for times we want to keep the array’s existing capacity.
var characters2 = ["Lana", "Pam", "Ray", "Sterling"]
print(characters2.count)
characters2.removeAll(keepingCapacity: true)
print(characters2.count)

func playGame(name: String, cheat: Bool = false) {
    if cheat {
        print("Let's play \(name); I bet I win!")
    } else {
        print("Let's play \(name)!")
    }
}
playGame(name: "Chess")


func playGolf(holes: Int = 18) {
    print("Let's play \(holes) holes of golf.")
}
playGolf()

func scoreGoal(overheadKick: Bool = false) {
    if overheadKick {
        print("Wow - amazing!")
    } else {
        print("Great goal!")
    }
}
scoreGoal(overheadKick: true)

func goToWarp(_ speed: Int) {
    if speed > 9 {
        print("The engines cannae take any more!")
    } else {
        print("Going to warp \(speed)...")
    }
}
goToWarp(8)

func takePicture(withFlash flash: Bool = true) {
    if flash {
        print("I'm taking a photo with flash")
    } else {
        print("I'm taking a photo")
    }
}
takePicture(withFlash: true)

func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")
parkCar("Tesla", automatically: false)

// error handling
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


enum PasswordError: Error {
    case short, obvious
}



let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}


let string2 = "12345"

do {
    let result = try checkPassword(string2)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}



//checkpoint-4 вычисление квадратного корня своими руками и ловля ошибок
func squareRoot(_ digit: Int) throws -> Int {
    var value = 0
    if digit < 1 || digit > 10000 {
        throw squareRootError.out
    } else {
        for _ in 1...100 {
            value += 1
            if value * value == digit {
                print("The square root of \(digit) is \(value).")
                return value
            }
        }
        throw squareRootError.out
        }
}

enum squareRootError: Error {
    case out, noroot
}

do {
    try squareRoot(25)
} catch squareRootError.out {
    print("Out of bounds.")
} catch squareRootError.noroot {
    print("No root.")
}
