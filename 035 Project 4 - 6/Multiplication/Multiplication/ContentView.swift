//
//  ContentView.swift
//  Multiplication
//
//  Created by val on 05/07/2025.
//
import SwiftUI

struct GameSettings: Hashable {
    let totalQuestions: Int
    let level: String
}

struct ContentView: View {
    
    @State private var selectedNumber = 5
    @State private var navigationPath = NavigationPath()
    @State private var selectedLevel = "easy"

    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                // Background image
                Image("background") // Ensure "background" is in Assets.xcassets
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all) // Updated to .ignoresSafeArea(.all)
                    .overlay(Color.black.opacity(0.3)) // Overlay for readability
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack {
                        Text("Choose number of questions")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                        
                        Picker("Number of questios", selection: $selectedNumber) {
                            // Making Picker has only 3 options 5, 10 ,20
                            ForEach([5, 10, 20], id: \.self) { number in
                                Text("\(number)").tag(number)
                            }
                        }
                        .pickerStyle(.wheel)
                        .padding(5)
                        .frame(width: 150, height: 150)
                    }
                    .padding(8)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("Choose complexity level")
                            .font(.title2)
                            .foregroundColor(.black)
                            .bold()
                        
                        Picker("Complexity level", selection: $selectedLevel) {
                            ForEach(["easy", "medium", "hard"], id: \.self) { level in
                                Text("\(level)").tag(level)
                            }
                        }
                        .pickerStyle(.wheel)
                        .padding(5)
                        .frame(width: 150, height: 150, alignment: .center)
                    }
                    .padding(8)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                    Spacer()
                    // One Submit button
                        Button("Submit") {
                            // Создаём структуру с выбранными значениями
                            let settings = GameSettings(totalQuestions: selectedNumber, level: selectedLevel)
                            navigationPath.append(settings)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Spacer() // Pushes the button to the center
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Start screen")
                                .font(.title.bold())
                                .foregroundColor(.white)
                        }
                    }
                    .navigationDestination(for: GameSettings.self) { settings in
                        GameView(totalQuestions: settings.totalQuestions, level: settings.level, navigationPath: $navigationPath)
                    }
                }
                .padding()
            }
        }
    }
}

struct GameView: View {
    
    let totalQuestions: Int
    let level: String
    @State private var totalQuestions2: Int
    @State private var questionCount = 0
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var result = 0
    @State private var feedback = "" // To show  the result of the check
    @Binding var navigationPath: NavigationPath // Add binding to control navigation
    @State private var score = 0
    
    // init vars (totalQuestions, navigationPath) that are comming from ContentView
    init(totalQuestions: Int, level: String, navigationPath: Binding<NavigationPath>) {
        self.totalQuestions = totalQuestions
        self._totalQuestions2 = State(initialValue: totalQuestions)
        self._navigationPath = navigationPath
        self.level = level
    }
    
    // func to get result of * 2 digigts
    var correct_result: Int {
        number1 * number2
    }
    
    // func to check is the user's answer right
    var check_result: Bool {
        if correct_result == result {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    private func generateNewQuestion() {
        if level == "easy" {
            number1 = Int.random(in: 0...3)
            number2 = Int.random(in: 0...3)
        } else if level == "medium" {
            number1 = Int.random(in: 0...6)
            number2 = Int.random(in: 0...6)
        } else if level == "hard" {
            number1 = Int.random(in: 0...10)
            number2 = Int.random(in: 0...10)
        } else {
            number1 = Int.random(in: 0...1)
            number2 = Int.random(in: 0...1)
        }
        result = 0
        feedback = ""
    }
    
    var body: some View {
        
        ZStack {
            // Background image
            Image("background") // Ensure "background" is in Assets.xcassets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all) // Updated to .ignoresSafeArea(.all)
                .overlay(Color.black.opacity(0.3)) // Overlay for readability
            
            // 0 VStack with 2 HStack inside
            VStack(spacing: 15) {
                
                // 1st HStack with 2 VStack inside
                HStack(spacing: 10) {
                    
                    // 1st VStack
                    VStack(spacing: 15) {
                        Text("Number of questions left: \(totalQuestions2)")
                            .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                        Text("Score: \(score)")
                            .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                        Text("Level: \(level)")
                            .foregroundColor(level == "easy" ? .green : level == "medium" ? .yellow : level == "hard" ? .red : .gray)
                        
                        Text("How much is \(number1) * \(number2)?")
                            .font(.title2)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Text("Choose the answer: \(result)")
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        // Shows text is the result correct or not
                        Text(feedback)
                            .font(.headline)
                            .foregroundColor(check_result ? .green : .red)
                        
                    }
                    .padding(8)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(8)
                    
                    // 2nd VStack
                    VStack(spacing: 15) {
                        
                        // Rotation wheel with digits
                        Picker("Digit", selection: $result) {
                            ForEach(0...100, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                        .pickerStyle(.wheel) // picker wheel
                        .frame(width: 150, height: 150)
                        
                        // Button for the result checking
                        Button(action: {
                            feedback = check_result ? "Correct!" : "Wrong! The answer is \(correct_result)."
                        }) {
                            Text("Check Answer")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding(8)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                    
                } // 1st HStack closed
                
                Spacer()
                    .frame(height: 20)
                
                // 2nd HStack with "New Question" button
                HStack(spacing: 10) {
                    
                    // Button to generate new question
                    Button(action: {
                        if totalQuestions2 > 0 {
                            generateNewQuestion()
                            result = 0
                            feedback = ""
                            totalQuestions2 -= 1
                        } else {
                            feedback = "Game Over!"
                        }
                    }) {
                        Text("New Question")
                            .padding()
                            .background(totalQuestions2 > 0 ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .disabled(totalQuestions2 <= 0)
                    
                    Button("Back to Start screen") {
                        navigationPath.removeLast() // Pop back to the previous screen
                    }
                    .padding()
                    .background(totalQuestions2 > 0 ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                } // 2nd HStack closed
                
            } // 0 VStack closed
            
        } // ZStack closed
        .navigationBarBackButtonHidden(true) // Remove default "Back" button from the GameView screen
        
    } // View closed
    
} // Content View closed

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
