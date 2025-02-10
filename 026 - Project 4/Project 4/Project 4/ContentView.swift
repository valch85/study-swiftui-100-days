//
//  ContentView.swift
//  Project 4
//
//  Created by Valentyn Chubukin on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .bold()
        
// use displayedComponents to decide what kind of options users should see .hourAndMinute users see just the hour and minute components
//        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
        
// an in parameter that works just the same as with Stepper: we can provide it with a date range, and the date picker will ensure the user can’t select beyond it.
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
        
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
            
    }
}

//func exampleDates() {
//    let now = Date.now
//    // create a second Date instance set to one day in seconds from now
//    let tomorrow = Date.now.addingTimeInterval(86400)
//    // create a range from those two
//    let range = now...tomorrow
//}

func exampleDates() {
    //    var components = DateComponents()
    //    components.hour = 8
    //    components.minute = 0
    //    let date = Calendar.current.date(from: components) ?? .now

    let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
}

#Preview {
    ContentView()
}
