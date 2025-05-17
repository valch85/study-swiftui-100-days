//
//  ContentView.swift
//  Animations2
//
//  Created by val on 18/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        VStack {
            Button("Tap me") {
                // do nothing
            }
            .padding(50)
            .background(.yellow)
            .foregroundStyle(.blue)
            .clipShape(.circle)
            
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
