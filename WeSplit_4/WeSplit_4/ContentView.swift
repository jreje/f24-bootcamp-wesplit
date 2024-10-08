//
//  ContentView.swift
//  WeSplit
//
//  Created by Julianne Rejesus  on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var numPeople = 0.0
    @State private var tipPercent = ""
    
    let tipPercentages = ["10%", "15%", "20%", "25%", "0%"]
    
    var totalWithTip: Double {
        switch tipPercent {
        case "10%":
            return amount * 1.1
        case "15%":
            return amount * 1.15
        case "20%":
            return amount * 1.2
        case "25%":
            return amount * 1.25
        default:
            return amount
        }
    }
    
    var amountPerPerson: Double {
        return (totalWithTip / numPeople)
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("WeSplit")
                    .font(.title)
                    .bold()
                
                Spacer()
            } .padding()
            
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .number)
                    TextField("Number of people", value: $numPeople, format:.number)
                }

                Section ("How much tip do you want to leave?") {
                    Picker ("Tip", selection: $tipPercent) {
                        ForEach(tipPercentages, id:\.self) {
                            tip in Text(tip)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Check Total With Tip") {
                    Text("$\(totalWithTip, specifier: "%.2f")")

                }
                
                Section("Amount Per Person") {
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                }
                
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
