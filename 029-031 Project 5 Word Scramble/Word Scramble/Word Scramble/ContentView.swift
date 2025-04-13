//
//  ContentView.swift
//  Word Scramble
//
//  Created by Valentyn Chubukin on 11/04/2025.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
/*
        // List mixed content
        List {
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
            }
            Section("Section 2") {
                ForEach(0..<2) {
                    Text("Dynamic Row \($0)")
                }
            }
            Section("Section 3") {
                Text("Static Row 3")
                Text("Static Row 4")
            }
        }
        .listStyle(.grouped)
        
        // List just dynamic content
        List (0..<2) {
                    Text("Dynamic Row \($0)")
        }
        
        // List from array dynamic
        List (people, id: \.self) {
                    Text($0)
        }
        
        // List from array mixed with ForEach
        List {
            Text("Static Row")
            ForEach (people, id: \.self) {
                        Text($0)
            }
            Text("Static Row")
        }
*/
    }
    // Loading resources from your app bundle
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            // we find a file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded file into a string!
            }
        }
    }
    // one-line string -> array
    func testStrings() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement() // return random element from array or nothing if array empty
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) // remove whitespaces & newlines
        
    }
    // multi-line string -> array
    func testStrings2() {
        let input2 = """
        a
        b
        c
        """
        let letters2 = input2.components(separatedBy: "\n")
        let letter2 = letters2.randomElement()// return random element from array or nothing if array empty
    }
    
    // work with spell checker
    func testStrings3() {
        // we create a word to check and an instance of UITextChecker that we can use to check that string
        let word = "swift"
        let checker = UITextChecker()
        // Objective-C does not use this method of storing letters; we asked Swift to create an Objective-C string range using the entire length of all our characters
        let range = NSRange(location: 0, length: word.utf16.count)
        // report where it found misspellings in our word
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        // sends back another Objective-C string range, telling us where the misspelling was found
        // Objective-C didn’t have any concept of optionals, so instead relied on special values to represent missing data.
        // if the Objective-C range comes back as empty (no spelling mistake) – then we get back the special value NSNotFound
        let allGood = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}

