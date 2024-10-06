//
//  ContentView.swift
//  GuessTheFlag2
//
//  Created by Valentyn Chubukin on 21/08/2024.
//

/*
 
1) Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.
2) When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
3) Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.

*/

import SwiftUI

// project 3 - challenge 2
struct FlagImage: View {
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
    }
    var country: String
    init(of country: String) {
        self.country = country
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreAmount = 0
    //@State private var showingNewGame = false
    @State private var newGameTitle = ""
    @State private var gamesAmount = 1
    
    var body: some View {
        ZStack {
            RadialGradient( stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            //LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Gues the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 25) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            //.foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(of: countries[number]) // project 3 - challenge 2
                            /*Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            */
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(scoreAmount)")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                
                Spacer()
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
                Text("Your score is \(scoreAmount) Restarting the game")
            } else {
                Text("Your score is \(scoreAmount)")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        gamesAmount += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreAmount += 1
        } else {
            scoreTitle = "Wrong. That’s the flag of \(countries[number])."
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
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
