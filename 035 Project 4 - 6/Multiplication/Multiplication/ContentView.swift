//
//  ContentView.swift
//  Multiplication
//
//  Created by val on 05/07/2025.
//
import SwiftUI

struct ContentView: View {
    
    @State private var selectedNumber = 5
    @State private var navigationPath = NavigationPath()

    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                // Background image
                Image("background") // Ensure "background" is in Assets.xcassets
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all) // Updated to .ignoresSafeArea(.all)
                    .overlay(Color.black.opacity(0.3)) // Overlay for readability
                
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
                    
                    Button("Submit") {
                        navigationPath.append(selectedNumber)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(8)
                .background(Color.white.opacity(0.5))
                .cornerRadius(8)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Start screen")
                            .font(.title.bold())
                            .foregroundColor(.white)
                        }
                    }
                .navigationDestination(for: Int.self) { number in
                    GameView(totalQuestions: number, navigationPath: $navigationPath)
                }
            }
        }
    }
}

struct GameView: View {
    
    let totalQuestions: Int
    @State private var totalQuestions2: Int
    @State private var questionCount = 0
    @State private var number1 = Int.random(in:0...10)
    @State private var number2 = Int.random(in:0...10)
    @State private var result = 0
    @State private var feedback = "" // To show  the result of the check
    @Binding var navigationPath: NavigationPath // Add binding to control navigation
    
    // init vars (totalQuestions, navigationPath) that are comming from ContentView
    init(totalQuestions: Int, navigationPath: Binding<NavigationPath>) {
        self.totalQuestions = totalQuestions
        self._totalQuestions2 = State(initialValue: totalQuestions)
        self._navigationPath = navigationPath
    }
    
    // func to get result of * 2 digigts
    var correct_result: Int {
        number1 * number2
    }
    
    // func to check is the user's answer right
    var check_result: Bool {
        if correct_result == result {
            return true
        } else {
            return false
        }
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
                        Text("How much is \(number1) * \(number2)?")
                            .font(.headline)
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
                            number1 = Int.random(in: 0...10)
                            number2 = Int.random(in: 0...10)
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
