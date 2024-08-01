import Cocoa

// How to work with variables inside classes

// Constant property, constant instance – a signpost that always points to the same user, who always has the same name.
/*
class User1 {
    let name1 = "Paul"
}

let user1 = User1()
user1.name1 = "Taylor"
print(user1.name1)
*/
// Constant property, variable instance – a signpost that always points to the same user, but their name can change.
class User2 {
    var name2 = "Paul"
}

let user2 = User2()
user2.name2 = "Taylor"
print(user2.name2)

// Variable property, constant instance – a signpost that can point to different users, but their names never change.
/*
class User3 {
    let name3 = "Paul"
}

var user3 = User3()
user3.name3 = "Taylor"
user3 = User3()
print(user3.name3)
*/
// Variable property, variable instance – a signpost that can point to different users, and those users can also change their names.
class User4 {
    var name4 = "Paul"
}

var user4 = User4()
user4.name4 = "Taylor"
user4 = User4()
print(user4.name4)


