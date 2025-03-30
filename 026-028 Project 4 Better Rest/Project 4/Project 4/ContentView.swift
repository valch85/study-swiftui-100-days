//
//  ContentView.swift
//  Project 4 Better rest
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
                // Challenge 1:
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                // Challenge 1:
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                // Challenge 1:
                Section {
                    Text("Dayly coffee intake")
                        .font(.headline)
                    // Challenge 2:
                    Picker("Coffee Intake", selection: $coffeeAmount) {
                        ForEach(amountCoffee, id: \.self) { amount in
                            Text("^[\(amount) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(.menu) // You can change to .wheel, .menu, .segmented, etc.
                    .padding()
                }
                // Challenge 3:
                Section {
                    Text("Recomendit bedtime is ")
                        .font(.headline)
                    
                    Text("\(calculateBedtime())")
                        .font(.title2)
                    
                }
                
                
            }
            .navigationTitle("BetterRest")
            /*.toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }*/
        }
    }
    // Challenge 3:
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            //alertTitle = "Your ideal bedtime is…"
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            //alertTitle = "Error"
            //alertMessage = "Sorry, there was a problem calculating your bedtime."
            return "Sorry, there was a problem calculating your bedtime."
        }
        //showingAlert = true
    }
}

#Preview {
    ContentView()
}
