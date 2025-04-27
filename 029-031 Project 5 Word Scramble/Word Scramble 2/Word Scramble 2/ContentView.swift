//
//  ContentView.swift
//  Word Scramble 2
//
//  Created by Valentyn Chubukin on 11/04/2025.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

// Func that change string to array
func stringToArray(_ input: String) -> [String] {
    return input.map { String($0) }
}

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score: Int = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            // Chalenge 2-3
            ZStack {
                HStack (spacing: 25) {
                    Text("Score:")
                        .font(.title2)
                    Text("\(score)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Button("Restart game") {
                        // Action when the button is tapped
                        restartGame()
                        print("Game restarted")
                    }.buttonStyle(CustomButtonStyle())
                    Button("Next word") {
                        // Action when the button is tapped
                        doneWord()
                    }.buttonStyle(CustomButtonStyle())
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            ZStack {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    Section {
                        ForEach(usedWords, id:\.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                            
                        }
                    }
                    
                }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK") { }
                } message: {
                    Text(errorMessage)
                }
            }
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isBig(word: answer) else {
            wordError(title: "Word less then 4 letters", message: "Make a word bigger!")
            return
        }
        
        guard isSame(word: answer) else {
            wordError(title: "Word is the same", message: "The same word forbidden!")
            return
        }
        
        // Chalenge 2-3
        countScore()
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    // Chalenge 2-3
    func countScore() {
       score = score + newWord.count
    }
    
    func startGame() {
        // find URL inside of the bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Couldn't load start.txt from bundle.")
    }
    
    // Chalenge 2-3
    func restartGame() {
        // find URL inside of the bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                score = 0
                return
            }
        }
        
        fatalError("Couldn't load start.txt from bundle.")
    }
    
    // Chalenge 2-3
    func doneWord() {
        // find URL inside of the bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                return
            }
        }
        
        fatalError("Couldn't load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // Chalenge 1
    // check that word be bigger then 3 letters
    func isBig(word: String) -> Bool {
        if word.count > 3 {
            return true
        } else {
            return false
        }
    }
    
    // check is the word the same like the original
    func isSame(word: String) -> Bool {
        if word == rootWord {
            return false
        } else {
            return true
        }
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    // check word for misspell
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
