import Cocoa

let surname: String = "Lasso"
var score: Int = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141

//array
var albums: [String] = ["Red", "Fearless"]
//dictionary
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
//crate empty array
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

let username: String
// lots of logic
username = "@twostraws"
//username = "taylor"
// lots of logic
print(username)

let scores: Int = "Zero"
