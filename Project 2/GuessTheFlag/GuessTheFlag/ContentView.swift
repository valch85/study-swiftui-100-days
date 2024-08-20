//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Valentyn Chubukin on 16/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Text("Hello, world!")
            Text("This is inside a stack")
            Spacer()
            Spacer()
        }
        ZStack(alignment: .top) {
            Text("Hello, world!")
            Text("This is inside a stack")
        }
    }
    
}

#Preview {
    ContentView()
}
