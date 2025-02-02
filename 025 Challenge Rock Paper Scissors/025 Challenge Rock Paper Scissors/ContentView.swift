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
    @State private var pcAnswer = Int.random(in: 0...2)
    
    @State private var scoreAmount = 0
    @State private var gamesAmount = 1
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                Text("Game Rock, Paper or Scissors. 8 rounds.")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.99), radius: 4.5, x: -10, y: 15)
                VStack(spacing: 25) {
                    VStack {
                        //Text("PC answer is: \(varAnswer[pcAnswer])" )
                        Text("Round # \(gamesAmount)")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
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
                /*
                Text("Score: \(scoreAmount)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                    .shadow(color: .black.opacity(0.99), radius: 4.5, x: -10, y: 15)
                Spacer()
                */
            }
            .padding()
            
            
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if gamesAmount > 8 {
                Button("Restart", action: newGame)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            if gamesAmount > 8 {
                Text("Your score is \(scoreAmount). You reach 8 games. Restart the game to continue.")
            } else {
                //Text("Your score is \(scoreAmount)")
            }
        }
        
        
    }


    func answerTap(_ userAnswer: String) {
        gamesAmount += 1
        switch(varAnswer[pcAnswer], userAnswer) {
            case ("Rock", "Rock"):
                scoreTitle = "Draw"
                scoreAmount = scoreAmount + 0
                showingScore = true
                break
            case ("Paper", "Paper"):
                scoreTitle = "Draw"
                scoreAmount = scoreAmount + 0
                showingScore = true
                break
            case ("Scissors", "Scissors"):
                scoreTitle = "Draw"
                scoreAmount = scoreAmount + 0
                showingScore = true
                break
            case ("Rock", "Paper"):
                scoreTitle = "Win. You choose Papre. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount + 1
                showingScore = true
                break
            case ("Rock", "Scissors"):
                scoreTitle = "Win. You choose Scissors. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount + 1
                showingScore = true
                break
            case ("Paper", "Rock"):
                scoreTitle = "Loss. You choose Rock. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount - 1
                showingScore = true
                break
            case ("Scissors", "Rock"):
                scoreTitle = "Win. You choose Rock. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount + 1
                showingScore = true
                break
            case ("Scissors", "Paper"):
                scoreTitle = "Loss. You choose Paper. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount - 1
                showingScore = true
                break
            case ("Paper", "Scissors"):
                scoreTitle = "Win. You choose Scissors. Compuret choose \(varAnswer[pcAnswer])."
                scoreAmount = scoreAmount + 1
                showingScore = true
                break
            default:
                break
        }
    }
    
    func askQuestion() {
        pcAnswer = Int.random(in: 0...2)
    }
    
    func newGame() {
        askQuestion()
        gamesAmount = 1
        scoreAmount = 0
    }

}

#Preview {
    ContentView()
}
