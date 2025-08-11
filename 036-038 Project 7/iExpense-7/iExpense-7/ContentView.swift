//
//  ContentView.swift
//  iExpense-7
//
//  Created by val on 11/08/2025.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    @State private var user = User (firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ContentView()
}
