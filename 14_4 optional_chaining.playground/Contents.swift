import Cocoa

// How to handle multiple optionals using optional chaining
let names4 = ["Arya", "Bran", "Robb", "Sansa"]
let names5 = [String]()
let chosen2 = names5.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen2)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
var author = book?.author?.first?.uppercased() ?? "A"
print(author)
var book2 = Book(title: "The Chronicles of Amber", author: "Roger Zelazny")
author = book2.author?.first?.uppercased() ?? "B"
print(author)

// Optional chaining Question 4/12 Answer: true
func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album = albumReleased(in: 2006)?.uppercased()
// Optional chaining Question 6/12 Answer: true
let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list")


