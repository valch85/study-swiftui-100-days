//
//  ContentView.swift
//  WeSplit
//
//  Created by Valentyn Chubukin on 08.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
    
    /*
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
*/
}

#Preview {
    ContentView()
}
