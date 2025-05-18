//
//  ContentView.swift
//  ViewsAndModifiers2
//
//  Created by Valentyn Chubukin on 30/08/2024.
//

import SwiftUI
// == Custom modifiers ==
// hello world yelow button
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            //.foregroundStyle(.white)
            .padding()
            .background(.yellow)
            .clipShape(.rect(cornerRadius: 10))
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
// Watermark
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

// == View composition ==
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundStyle(.white)
            .background(.green)
            .clipShape(.capsule)
    }
}

struct ContentView: View {
    var body: some View {
        // == Custom modifiers ==
        // hello world yelow button
        Text("Hello World")
            // strate from ViewModifier
            //.modifier(Title())
            // with extention titleStyle
            .titleStyle()
        
        // Watermark
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
        
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
