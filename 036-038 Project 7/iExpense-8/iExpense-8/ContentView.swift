//
//  ContentView.swift
//  iExpense-8
//
//  Created by valch85 on 12/08/2025.
//

import SwiftUI

struct ExpenceItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenceItem]() {
        // item -> json
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // json -> item
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //when we add ": Identifiable" on struct ExpenceItem we don't need more to say by what id we are identify items
                ForEach(expenses.items) { item in
                //ForEach(expenses.items, id: \.id) { item in
                    // Make layout with name, type and price
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name) //name
                                .font(.headline)
                            Text(item.type) //type
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "EUR")) //price
                    }
                }
                // to make deletation
                .onDelete(perform: removeItems)
            }
            // name of the View
            .navigationTitle("iExpense")
            // add button to switch to "AddView" by change "showingAddExpense" in "true"
            .toolbar {
                Button("Add Expanse", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            // flag that will switch to "AddView" if "showingAddExpense" is in "true"
            .sheet(isPresented: $showingAddExpense) {
                // push to vew expenses as expenses
                AddView(expenses: expenses)
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
