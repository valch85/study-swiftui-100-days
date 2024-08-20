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
            Color(red: 1, green: 0.8, blue: 0)
            Text("Hello, world!")
            Text("This is inside a stack")
            Spacer()
            Spacer()
        }
        .ignoresSafeArea()
        //.background(.blue)
        ZStack(alignment: .top) {
            Color.red
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("This is inside a stack")
                //.background(.red)
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    ContentView()
}
