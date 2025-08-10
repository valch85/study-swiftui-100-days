//
//  ContentView.swift
//  iExpense-4
//
//  Created by val on 10/08/2025.
//

import SwiftUI

struct SecondView: View {
    // var to dissmiss this view
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        // button to dissmiss this view
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // content of our sheet
            SecondView(name: "@valch85")
        }
    }
}

#Preview {
    ContentView()
}
