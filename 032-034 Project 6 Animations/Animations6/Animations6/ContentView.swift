//
//  ContentView.swift
//  Animations6
//
//  Created by val on 18/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap me") {
                isShowingRed.toggle()
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
