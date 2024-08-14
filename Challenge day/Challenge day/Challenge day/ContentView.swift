//
//  ContentView.swift
//  Challenge day
//
//  Created by Valentyn Chubukin on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredUnitsAmount = 0.0
    @State private var enteredUnits = 0.0
    @State private var resultUnitsAmount = 0.0
    @State private var resultUnits = 0.0
    @FocusState private var enteredIsFocused: Bool
    
    enteredUnits = []
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $enteredUnitsAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($enteredIsFocused)
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $enteredUnits) {
                        ForEach(enteredUnits, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) //make choose option like a buttons
                    
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
