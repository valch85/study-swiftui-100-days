//
//  ContentView.swift
//  ViewsAndModifiers1
//
//  Created by Valentyn Chubukin on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        // 1 create one button and recolor it when needed - more efficient way
        Button("Hello, world!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .green)
        // 2 this actually creates more work for SwiftUI – rather than seeing one Button being used with different colors, it now sees two different Button views, and when we flip the Boolean condition it will destroy one to create the other rather than just recolor what it has
        if useRedText {
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundStyle(.orange)
        } else {
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundStyle(.yellow)
        }
        
        Button("Hello, world!") {
            useRedText.toggle()
            //print(type(of: self.body))
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
