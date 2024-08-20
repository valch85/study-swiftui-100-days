//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Valentyn Chubukin on 16/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
        
        //Image(decorative: "singapore") // need to load inside of the project
        Image(systemName: "pencil") // take from the system
            .foregroundStyle(.red)
            .font(.largeTitle)
        VStack(alignment: .leading, spacing: 20) {
            Color(red: 1, green: 0.8, blue: 0)
            Text("Hello, world!")
            Text("This is inside a stack")
            Spacer()
            Spacer()
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
            //buttons have diff style becours of the role (ex. destructive - is red)
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            // custom button style
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
        .ignoresSafeArea()
        //.background(.blue)
        ZStack(alignment: .center) {
            //LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            //RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            Text("This is inside a stack")
                //.background(.red)
        }
        
        // reference to the function on actions
        Button("Delete selection", role: .destructive, action: executeDelete)
        
        Button {
            print("Edit button was tapped")
        } label: {
            Image(systemName: "pencil")
        }
        
        Button("Edit", systemImage: "pencil") {
            print("Edit button was tapped")
        }
        
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
    func executeDelete() {
            print("Now deleting…")
        }
}

#Preview {
    ContentView()
}
