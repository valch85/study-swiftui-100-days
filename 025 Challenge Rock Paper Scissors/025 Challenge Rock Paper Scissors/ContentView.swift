//
//  ContentView.swift
//  025 Challenge Rock Paper Scissors
//
//  Created by Valentyn Chubukin on 25/01/2025.
//

/*
Each turn of the game the app will randomly pick either rock, paper, or scissors.
Each turn the app will alternate between prompting the player to win or lose.
The player must then tap the correct move to win or lose the game.
If they are correct they score a point; otherwise they lose a point.
The game ends after 10 questions, at which point their score is shown.
*/

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


struct ContentView: View {
    @State private var varAnswer = ["Rock", "Paper", "Scissors"]
    @State private var scoreAmount = 0
    @State private var pcAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient( stops: [
                .init(color: Color(red: 0.0, green: 0.0, blue: 1), location: 0.3),
                .init(color: Color.yellow, location: 0.7)
            ], center: .top, startRadius: 300, endRadius: 700)
            //LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Game Rock, Paper or Scissors:")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.99), radius: 4.5, x: -10, y: 15)
                VStack(spacing: 25) {
                    VStack {
                        Text("PC answer is: \(varAnswer[pcAnswer])" )
                        Text("Choose yours answer:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                    }
                    Button("Rock") {
                                // Action when the button is tapped
                        answerTap("Rock")
                                print("Rock button tapped!")
                    }.buttonStyle(CustomButtonStyle())
                    Button("Paper") {
                                // Action when the button is tapped
                        answerTap("Paper")
                                print("Paper button tapped!")
                    }.buttonStyle(CustomButtonStyle())
                    Button("Scissors") {
                                // Action when the button is tapped
                        answerTap("Scissors")
                                print("Scissors button tapped!")
                    }.buttonStyle(CustomButtonStyle())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(scoreAmount)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .shadow(color: .black.opacity(0.99), radius: 4.5, x: -10, y: 15)
                Spacer()
            }
            .padding()
            
            
            
        }
        
        
    }


    func answerTap(_ userAnswer: String) {
        switch(varAnswer[pcAnswer], userAnswer) {
            case ("Rock", "Rock"):
                scoreAmount = scoreAmount + 0
                break
            case ("Paper", "Paper"):
                scoreAmount = scoreAmount + 0
                break
            case ("Scissors", "Scissors"):
                scoreAmount = scoreAmount + 0
                break
            case ("Rock", "Paper"):
                scoreAmount = scoreAmount - 1
                break
            case ("Rock", "Scissors"):
                scoreAmount = scoreAmount + 1
                break
            case ("Paper", "Rock"):
                scoreAmount = scoreAmount - 1
                break
            case ("Scissors", "Rock"):
                scoreAmount = scoreAmount + 1
                break
            case ("Scissors", "Paper"):
                scoreAmount = scoreAmount - 1
                break
            case ("Scissors", "Rock"):
                scoreAmount = scoreAmount + 1
                break
            default:
                break
        }
    }

}

#Preview {
    ContentView()
}
