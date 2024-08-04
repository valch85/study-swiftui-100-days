import Cocoa

//Checkpoint 7

class Aminal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dod: Aminal {
    func speak() {
        print("Bark-bark")
    }
}

class Cat: Aminal {
    var isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Miau-Miau")
    }
}

class Corgi: Dod {
    override func speak() {
        print("Woof-woof")
    }
}

class Poodle: Dod {
    override func speak() {
        print("Gav-gav")
    }
}

class PersianCat: Cat {
    override func speak() {
        print("Nyaf-nyaf")
    }
}

class MainCun: Cat {
    override func speak() {
        print("Frr-frr")
    }
}

let mash = MainCun(legs: 4, isTame: true)
print(mash.legs, mash.isTame, mash.speak())
let ron = Poodle(legs: 4)
print(ron.legs, ron.speak())
