//
//  ContentView.swift
//  iExpense-5
//
//  Created by val on 10/08/2025.
//

import SwiftUI
    

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
