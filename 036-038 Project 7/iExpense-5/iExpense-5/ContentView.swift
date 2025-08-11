//
//  ContentView.swift
//  iExpense-5
//
//  Created by val on 10/08/2025.
//

import SwiftUI
    

struct ContentView: View {
    
    // when UserDefaults used
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // to save in AppStorage
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)" ) {
            tapCount += 1
            
            // when UserDefaults used
            //UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
    
}

#Preview {
    ContentView()
}
