//
//  ContentView.swift
//  Word Scramble
//
//  Created by Valentyn Chubukin on 11/04/2025.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        
        // List mixed content
        List {
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
            }
            Section("Section 2") {
                ForEach(0..<2) {
                    Text("Dynamic Row \($0)")
                }
            }
            Section("Section 3") {
                Text("Static Row 3")
                Text("Static Row 4")
            }
        }
        .listStyle(.grouped)
        
        // List just dynamic content
        List (0..<2) {
                    Text("Dynamic Row \($0)")
        }
        
        // List from array dynamic
        List (people, id: \.self) {
                    Text($0)
        }
        
        // List from array mixed with ForEach
        List {
            Text("Static Row")
            ForEach (people, id: \.self) {
                        Text($0)
            }
            Text("Static Row")
        }
        
    }
}

#Preview {
    ContentView()
}
