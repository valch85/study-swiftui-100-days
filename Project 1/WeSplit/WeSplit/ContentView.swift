//
//  ContentView.swift
//  WeSplit
//
//  Created by Valentyn Chubukin on 08.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
