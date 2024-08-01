import Cocoa

//How to create a deinitializer for a class
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}


print("Without immediate destruction")
var users = [User]()
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    //doesn't say that it is destroyed course it will be used in array (look in the next line)
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")
