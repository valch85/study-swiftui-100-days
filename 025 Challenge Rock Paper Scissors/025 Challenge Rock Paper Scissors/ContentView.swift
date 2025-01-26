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

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
