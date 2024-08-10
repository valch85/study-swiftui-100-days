//
//  ContentView.swift
//  WeSplit
//
//  Created by Valentyn Chubukin on 08.08.2024.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    @State private var name = ""
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello, world!")
            Text("You name is \(name)")
        }
        NavigationStack {
            Form {
                //ForEach(0..<100) { number in
                //        Text("Row \(number)")
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
        Form {
            //ForEach(0..<100) { number in
            //        Text("Row \(number)")
            ForEach(0..<100) {
                Text("Row \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}
