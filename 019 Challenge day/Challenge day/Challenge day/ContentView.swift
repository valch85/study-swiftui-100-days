//
//  ContentView.swift
//  Challenge day
//
//  Created by Valentyn Chubukin on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredUnitsAmount = 0.0
    @State private var enteredUnit = "meters"
    @State private var resultUnit = "meters"
    @FocusState private var enteredIsFocused: Bool
    
    let enteredUnits = ["meters", "kilometers", "feet", "yard", "miles"]
    let resultUnits = ["meters", "kilometers", "feet", "yard", "miles"]
    
    var resultUnitsAmount: Double {
        var rrr = 0.0
        if enteredUnit == "meters" && resultUnit == "kilometers" {
           rrr = enteredUnitsAmount / 1000
        }
        if enteredUnit == "meters" && resultUnit == "feet" {
            rrr = enteredUnitsAmount * 3.28084

        }
        if enteredUnit == "meters" && resultUnit == "yard" {
            rrr = enteredUnitsAmount * 1.09361

        }
        if enteredUnit == "meters" && resultUnit == "miles" {
            rrr = enteredUnitsAmount / 1609.34

        }
        if enteredUnit == "kilometers" && resultUnit == "meters" {
           rrr = enteredUnitsAmount * 1000
        }
        if enteredUnit == "kilometers" && resultUnit == "feet" {
            rrr = enteredUnitsAmount * 3.28084 / 1000

        }
        if enteredUnit == "kilometers" && resultUnit == "yard" {
            rrr = enteredUnitsAmount * 1.09361 / 1000

        }
        if enteredUnit == "kilometers" && resultUnit == "miles" {
            rrr = enteredUnitsAmount / 1609.34 / 1000

        }
        if enteredUnit == "feet" && resultUnit == "meters" {
            rrr = enteredUnitsAmount / 3.28084
        }
        if enteredUnit == "feet" && resultUnit == "kilometers" {
            rrr = enteredUnitsAmount / 3280.84

        }
        if enteredUnit == "feet" && resultUnit == "yard" {
            rrr = enteredUnitsAmount / 3

        }
        if enteredUnit == "feet" && resultUnit == "miles" {
            rrr = enteredUnitsAmount / 5280

        }
        if enteredUnit == "yard" && resultUnit == "meters" {
            rrr = enteredUnitsAmount / 1.094
        }
        if enteredUnit == "yard" && resultUnit == "kilometers" {
            rrr = enteredUnitsAmount / 1094

        }
        if enteredUnit == "yard" && resultUnit == "feet" {
            rrr = enteredUnitsAmount * 3

        }
        if enteredUnit == "yard" && resultUnit == "miles" {
            rrr = enteredUnitsAmount / 1760

        }
        if enteredUnit == "miles" && resultUnit == "meters" {
            rrr = enteredUnitsAmount * 1609
        }
        if enteredUnit == "miles" && resultUnit == "kilometers" {
            rrr = enteredUnitsAmount * 1.609

        }
        if enteredUnit == "miles" && resultUnit == "feet" {
            rrr = enteredUnitsAmount * 5280

        }
        if enteredUnit == "miles" && resultUnit == "yard" {
            rrr = enteredUnitsAmount * 1760

        }
        if enteredUnit == resultUnit {
            rrr = enteredUnitsAmount

        }
        return rrr
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("To convert") {
                    TextField("Amount of units", value: $enteredUnitsAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($enteredIsFocused)
                    /*Picker("Units", selection: $enteredUnit) {
                        ForEach(enteredUnits, id: \.self) {
                            Text($0)
                        }
                    }*/
                    
                    Picker("Units", selection: $enteredUnit) {
                        ForEach(enteredUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented) //make choose option like a buttons
                    
                }
                Section ("Result") {
                    Picker("Units", selection: $resultUnit) {
                        ForEach(resultUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(resultUnitsAmount.formatted())")
                }
            }
            .navigationTitle("Lenth converter")
            .toolbar {
                if enteredIsFocused {
                    Button("Done") {
                        enteredIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
