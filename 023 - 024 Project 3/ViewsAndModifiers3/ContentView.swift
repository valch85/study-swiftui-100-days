//
//  ContentView.swift
//  ViewsAndModifiers3
//
//  Created by Valentyn Chubukin on 23/09/2024.
//
// project 3 - challenge 3
import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(.black)
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
            .padding()

    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.blue, .black]),
                center: .top,
                startRadius: 60,
                endRadius: 450
            )
            .ignoresSafeArea()
            Text("Prominent Title")
                .titleStyle()
        }
            
    }
}

#Preview {
    ContentView()
}
