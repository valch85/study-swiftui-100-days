import Cocoa

// Checkpoint 9

// Write a function that accepts an optional array of integers, and returns one randomly.
// If the array is missing or empty, return a random number in the range 1 through 100.
// Write your function in a single line of code

func randomly(_ array:[Int]? = nil) -> Int { return (array?.randomElement() ?? Int.random(in: 1...100)) }

print(randomly())
print(randomly([30, 4000, 69, 1, 54000, 46]))
