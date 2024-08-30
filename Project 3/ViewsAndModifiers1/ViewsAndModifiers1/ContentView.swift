//
//  ContentView.swift
//  ViewsAndModifiers1
//
//  Created by Valentyn Chubukin on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(.red)
        .frame(width: 200, height: 200)
        .background(.red)
        Text("Hello, World!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.yellow)
            .padding()
            .background(.green)
    }
}

#Preview {
    ContentView()
}
