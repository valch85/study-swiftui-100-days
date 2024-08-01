import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is not \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Creating your own classes Question 6/12
class Image {
    var filename: String
    var isAnimated: Bool
    init(filename: String, isAnimated: Bool) {
        self.filename = filename
        self.isAnimated = isAnimated
    }
}
