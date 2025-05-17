//
//  ContentView.swift
//  Animations3
//
//  Created by val on 18/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200 , height: 200)
        .background(enabled ? .yellow : .red)
        .foregroundStyle(.blue)
        //.clipShape(.rect(cornerRadius: enabled ? 60 : 0)) // 1st animation will applied to clipShape as it goes after
        .animation(nil, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0)) // 1st animation will NOT applied to clipShape as it goes before
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled) //2nd animation control only the clipShape
    }
}

#Preview {
    ContentView()
}
