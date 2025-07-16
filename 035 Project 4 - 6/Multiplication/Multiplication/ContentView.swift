//
//  ContentView.swift
//  Multiplication
//
//  Created by val on 05/07/2025.
//
import SwiftUI

struct ContentView: View {
    
    @State private var questionCount = 0
    @State private var number1 = Int.random(in:0...10)
    @State private var number2 = Int.random(in:0...10)
    @State private var result = 0
    @State private var feedback = "" // To show  the result of the check
    
    // func to get result of * 2 digigts
    var correct_result: Int {
        number1 * number2
    }
    
    //func to check is the user's answer right
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
                        number1 = Int.random(in: 0...10)
                        number2 = Int.random(in: 0...10)
                        result = 0
                        feedback = ""
                    }) {
                        Text("New Question")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    
                } // 2nd HStack closed
                
            } // 0 VStack closed
            
        } // ZStack closed
        
    } // View closed
    
} // Content View closed


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
