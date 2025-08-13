//
//  ContentView.swift
//  iExpense-8
//
//  Created by val on 12/08/2025.
//

import SwiftUI

struct ExpenceItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expaenses {
    var items = [ExpenceItem]()
}

struct ContentView: View {
    
    @State private var expenses = Expaenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expanse", systemImage: "plus") {
                    let expense = ExpenceItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
