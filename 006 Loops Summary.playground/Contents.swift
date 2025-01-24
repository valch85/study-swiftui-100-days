import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    //print("5 x \(i) is \(5 * i)")
    print("The \(i) times table")
    
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
    
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}


var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

var numbers = [1, 2, 3, 4, 5, 6]
for number in numbers {
    if number.isMultiple(of: 2) {
        print(number)
    }
}

var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Criticl hit!")

let colors = ["Red", "Green", "Blue", "Orange", "Yellow"]
var colorCounter = 0
while colorCounter < 5 {
    print("\(colors[colorCounter]) is a popular color.")
    colorCounter += 1
}

print("Color is \(colors[1])")


var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2.")
    counter *= 2
    print(counter)
}

var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.\(cats)")
}

var itemsSold: Int = 0
while itemsSold < 5000 {
    itemsSold += 100
    if itemsSold.isMultiple(of: 10000) {
        print("\(itemsSold) items sold - a big milestone!")
    }
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

// skip item in a loop
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

// to brake when the issue
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)


// labeled statements
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

//Checkpoint 3
for i in 1...100 {
    if i.isMultiple(of: 5) && i.isMultiple(of: 3) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

// Repeat loops Question 10/12
var frogs = 4
repeat {
    for _ in 1...frogs {
        print("Ribbit!")
    }
} while false

// Repeat loops Question 11/12
var encores = 0
repeat {
    print("Let's play that piece again.")
    encores += 1
} while encores < 3

// Repeat loops Question 12/12
var scales = ["A", "B", "C", "D", "E"]
var scaleCounter = 0
repeat {
    print("Play the \(scales[scaleCounter]) scale")
    scaleCounter += 1
} while scaleCounter < 3

// Skipping items Question 2/12 Answer: false
//This will print four lines of text.
var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal
// Skipping items Question 3/12 Answer: true
let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
var position = 0
while position <= 7 {
    print("position: \(position)")
    let value = fibonacci[position]
    position += 1
    if value < 2 {
       continue
    }
    print("Fibonacci number \(position) is \(value)")
}
// Skipping items Question 4/12 Answer: true
for i in 1...15 {
    let square = i * i
    if i == 8 {
        continue
    }
    print("\(i) squared is \(square)")
}
// Skipping items Question 5/12 Answer: false
// kidsInClass is declared as a constant, so it can't be modified.
//let kidsInClass = 0
var kidsInClass = 0
while kidsInClass < 30 {
    print("Add another child to the class")
    kidsInClass += 1
}
// Skipping items Question 6/12 Answer: false
var passengerNumber = 0
// This is missing a brace at the start of the while loop.
while passengerNumber < 30 {
    passengerNumber += 1
    if passengerNumber == 13 {
        print("Let's skip the unlucky one.")
        continue
    }
    print("Now boarding passenger \(passengerNumber)")
}
// Skipping items Question 11/12 Answer: false
for i in 1...5 {
    if i == 5 {
        continue
    }
    let sum = i + i
    print("\(i) + \(i) is \(sum).")
}
// Skipping items Question 12/12 Answer: true
var carsProduced = 0
repeat {
    carsProduced += 1
    if carsProduced.isMultiple(of: 2) {
        continue
    }
    print("Another car was built.")
} while carsProduced < 20

