//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Heather Mason on 1/18/20.
//  Copyright © 2020 Heather Mason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputAmount = ""
    @State private var startingUnit = 1
    @State private var finalUnit = 1
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var startingUnitString: String {
        return temperatureUnits[startingUnit]
    }
    
    var finalAmount: Double {
        let inputDouble = Double(inputAmount) ?? 0
        
        if temperatureUnits[startingUnit] == temperatureUnits[finalUnit] {
            return inputDouble
        }

        if temperatureUnits[startingUnit] == "Celsius" && temperatureUnits[finalUnit] == "Fahrenheit" {
            return (inputDouble * 9 / 5) + 32
        }
        
        if temperatureUnits[startingUnit] == "Celsius" && temperatureUnits[finalUnit] == "Kelvin" {
            return inputDouble + 273.15
        }
        
        if temperatureUnits[startingUnit] == "Fahrenheit" && temperatureUnits[finalUnit] == "Celsius" {
            return (inputDouble - 32) * 5 / 9
        }
        
        if temperatureUnits[startingUnit] == "Fahrenheit" && temperatureUnits[finalUnit] == "Kelvin" {
            return (inputDouble - 32) * 5 / 9 + 273.15
        }
        
        if temperatureUnits[startingUnit] == "Kelvin" && temperatureUnits[finalUnit] == "Celsius" {
            return inputDouble - 273.15
        }
        
        if temperatureUnits[startingUnit] == "Kelvin" && temperatureUnits[finalUnit] == "Fahrenheit" {
            return (inputDouble - 273.15) * 9 / 5 + 32
        }
        
        return 1.00
    }
    var finalUnitString: String {
        return temperatureUnits[finalUnit]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to convert", text: $inputAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Convert from:")) {
                    Picker("Input amount", selection: $startingUnit) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to:")) {
                    Picker("Final amount", selection: $finalUnit) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(inputAmount) \(startingUnitString) is \(finalAmount, specifier: "%.2f") \(finalUnitString)")
                }
            }
        .navigationBarTitle("TemperatureConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
