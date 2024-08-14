//
//  ContentView.swift
//  Challenge day
//
//  Created by Valentyn Chubukin on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredUnitsAmount = 0.0
    @State private var enteredUnit = "mm"
    @State private var resultUnitsAmount = 0.0
    @State private var resultUnits = 0.0
    @FocusState private var enteredIsFocused: Bool
    
    let enteredUnits = ["mm", "cm", "meters", "kilometers", "feet", "yard", "miles"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("To convert") {
                    TextField("Amount of units", value: $enteredUnitsAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($enteredIsFocused)
                    Picker("Units", selection: $enteredUnit) {
                        ForEach(enteredUnits, id: \.self) {
                            Text($0)
                        }
                    }
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
