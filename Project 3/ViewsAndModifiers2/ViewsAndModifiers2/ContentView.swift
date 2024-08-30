//
//  ContentView.swift
//  ViewsAndModifiers2
//
//  Created by Valentyn Chubukin on 30/08/2024.
//

import SwiftUI

// == View composition ==
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ContentView: View {
    var body: some View {
        // == View composition ==
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
