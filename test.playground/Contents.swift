import Cocoa

struct Park {
    var numberOfFlowers = 1000
    mutating func plantFlowers() {
        numberOfFlowers += 50
    }
}
var park1 = Park()
park1.plantFlowers()
print(park1.numberOfFlowers)
var park2 = Park()
print(park2.numberOfFlowers)
var park3 = Park()
park3.plantFlowers()
park3.plantFlowers()
park3.plantFlowers()
park3.plantFlowers()
print(park3.numberOfFlowers)

class User2 {
    var name2 = "Paul"
}

let user2 = User2()
print(user2.name2)
user2.name2 = "Taylor"
print(user2.name2)
let user3 = User2()
print(user3.name2)

print ("+++++++")

class User4 {
    var name4 = "Paul"
}

var user4 = User4()         //user4: Paul
user4.name4 = "Taylor"      //user4: Taylor
print(user4.name4)          //user4: Taylor
var user5 = user4           //user5: Taylor
print(user5.name4)          //user5: Taylor
user4 = User4()             //user4: Paul       //Здесь сбивается связь объектов - что один копия другого так как мы перезаписываем переменную наследуясь снова от класса. Переменная user5 начинает жить своей жизнью не меняя переменную user4 и на оборот user4 не меняет переменную user5. Here the connection between objects gets lost - that one is a copy of the another, since we overwrite the variable by inheriting again from the class. The user5 variable begins to live its own life without changing the user4 variable and, conversely, user4 does not change the user5 variable
print(user4.name4)          //user4: Paul
print(user5.name4)          //user5: Taylor
user5.name4 = "Ringo"       //user5: Ringo
print(user5.name4)          //user5: Ringo
print(user4.name4)          //user4: Paul
user4.name4 = "Diego"       //user4: Diego
print(user4.name4)          //user4: Diego
print(user5.name4)          //user5: Ringo

// Dictionary
var massiv = [
    1: "One",
    2: "Two",
    3: "Tri"
]
massiv.removeValue(forKey: 2)
print(massiv)
