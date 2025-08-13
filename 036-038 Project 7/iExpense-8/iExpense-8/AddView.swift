//
//  AddView.swift
//  iExpense-8
//
//  Created by valch85 on 13/08/2025.
//

import SwiftUI

struct AddView: View {
    
    @State private var name: String = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "EUR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expence")
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
