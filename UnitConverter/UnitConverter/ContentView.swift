//
//  ContentView.swift
//  UnitConverter
//
//  Created by Heather Mason on 1/16/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var inputAmount = ""
//    @State private var startingUnit = 1
//    @State private var endingUnit = 1
//
//    let temperatureUnits = [1, 3, 8]// ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            // user input: amount to convert
            // unit to convert from
            // units to convert to
            // converted amount result
            Form {
                Section {
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Unit to convert from")) {
                    Picker("Starting unit", selection: $startingUnit) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0])")
//                             Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Unit to convert to")) {
                    Picker("Ending unit", selection: $endingUnit)
                }
                
                Section {
                    Text("Thats that")
                }
            }
        .navigationBarTitle("UnitConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
