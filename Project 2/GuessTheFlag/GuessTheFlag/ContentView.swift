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
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
        .ignoresSafeArea()
        //.background(.blue)
        ZStack(alignment: .center) {
            //LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            //RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            Text("This is inside a stack")
                //.background(.red)
        }
    }
    
}

#Preview {
    ContentView()
}
