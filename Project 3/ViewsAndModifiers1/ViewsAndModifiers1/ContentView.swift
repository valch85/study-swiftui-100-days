//
//  ContentView.swift
//  ViewsAndModifiers1
//
//  Created by Valentyn Chubukin on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    // == Conditional modifiers ==
    @State private var useRedText = false
    
    // == Views as properties ==
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    var spells1: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    // you can also send back a Group
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    // third option is to add the @ViewBuilder attribute yourself
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        // == Views as properties ==
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
                }
        // == Environment modifiers ==
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
        .padding()
        
        // == Conditional modifiers ==
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
        
        // == Why modifier order matters + What is behind the main SwiftUI view? ==
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
