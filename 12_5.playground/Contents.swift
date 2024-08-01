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

// Deinitializers Question 7/12 true
class Lightsaber {
    deinit {
        print("Fssshhp!")
    }
}

// Deinitializers Question 8/12 false
class Election {
    init() {
        print("And the winner is...")
    }
}

// Deinitializers Question 9/12 true
class DisneyMovie {
    deinit {
        print("Relax, there'll be another in a year.")
    }
}

// Deinitializers Question 12/12 true
class Firefly {
    deinit {
        print("I'm still annoyed that this was cancelled.")
    }
}
