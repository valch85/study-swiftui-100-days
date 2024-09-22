//
//  ContentView.swift
//  WeSplit
//
//  Created by Valentyn Chubukin on 08.08.2024.
//
// Tasks

// - Add a header to the third section, saying “Amount per person”
// - Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
// - Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2 //this is not a real number of peopel but order number; это не реальное количество людей а лишь порядковый номер выпадающего списка (потому и показывает 4)
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection =  Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        // 2nd task
        let tipSelection =  Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink) //make selection option in a separete window; with faster scroll??
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) { //3d task
                            Text("\($0) percent")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    /* Old variand with buttons
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) //make choose option like a buttons
                    */
                }
                Section("Amount total") { //1st task
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .foregroundColor(tipPercentage == 0 ? .red : .black) //project 3 -challenge 1
                Section("Amount per person") { //1st task
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
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
