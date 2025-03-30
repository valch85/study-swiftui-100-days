//
//  ContentView.swift
//  Project 4
//
//  Created by Valentyn Chubukin on 09/02/2025.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var amountCoffee = Array(0...10)
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Dayly coffee intake")
                        .font(.headline)
                    
                    //Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    Picker("Coffee Intake", selection: $coffeeAmount) {
                        ForEach(amountCoffee, id: \.self) { amount in
                            Text("^[\(amount) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(.menu) // You can change to .wheel, .menu, .segmented, etc.
                    .padding()
                    //Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
                
                
            }
            //Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            //.bold()
            
            
            // use displayedComponents to decide what kind of options users should see .hourAndMinute users see just the hour and minute components
            //        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            // an in parameter that works just the same as with Stepper: we can provide it with a date range, and the date picker will ensure the user can’t select beyond it.
            /*DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
             .labelsHidden()
             
             Text("HM: \(Date.now, format: .dateTime.hour().minute())")
             Text("DMY: \(Date.now, format: .dateTime.day().month().year())")
             Text("Shorteneed: \(Date.now.formatted(date: .long, time: .shortened))")
             */
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
        
    }
}

/*
func exampleDates() {
    let now = Date.now
    // create a second Date instance set to one day in seconds from now
    let tomorrow = Date.now.addingTimeInterval(86400)
    // create a range from those two
    let range = now...tomorrow
}

func exampleDates() {
    //    var components = DateComponents()
    //    components.hour = 8
    //    components.minute = 0
    //    let date = Calendar.current.date(from: components) ?? .now

    let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
}
*/

#Preview {
    ContentView()
}
