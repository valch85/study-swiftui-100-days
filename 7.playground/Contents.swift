import Cocoa


func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}


func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)


func printTimesTablesEnd(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

//printTimesTablesEnd(number: 5, end: 20)
printTimesTablesEnd(number: 20, end: 5)

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//check lines
func stringChaker(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

print (stringChaker (string1: "acb", string2: "cba"))

//pifagor
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let d = pythagoras2(a: 3, b: 4)
print(d)
