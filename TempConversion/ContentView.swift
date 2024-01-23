//
//  ContentView.swift
//  TempConversion
//
//  Created by Lucas Omar on 2024-01-23.
//Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.
//Length conversion: users choose meters, kilometers, feet, yards, or miles.
//Time conversion: users choose seconds, minutes, hours, or days.
//Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
//If you were going for length conversion you might have:
//
//A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
//A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
//A text field where users enter a number.
//A text view showing the result of the conversion.

import SwiftUI


struct ContentView: View {
    @State private var defaultTemperatureInput = "Celsius"
    @State private var defaultTemperatureOutput = "Farenheit"

    @State private var temperatureType = ["Celsius", "Farenheit", "Kelvin"]
    
    @State private var temperatureInput = 0.0
    
    var temperatureTotal: Double {
        var totalTemp = 0.0
        if defaultTemperatureInput == "Celsius" && defaultTemperatureOutput == "Celsius" {
             totalTemp = temperatureInput
        } else if defaultTemperatureInput == "Celsius" && defaultTemperatureOutput == "Farenheit" {
            totalTemp = (temperatureInput * 9/5) + 32
        } else if defaultTemperatureInput == "Celsius" && defaultTemperatureOutput == "Kelvin" {
            totalTemp = temperatureInput + 273.15
        } else if defaultTemperatureInput == "Farenheit" && defaultTemperatureOutput == "Celsius" {
            totalTemp = (temperatureInput - 32) * 5/9
        } else if defaultTemperatureInput == "Farenheit" && defaultTemperatureOutput ==
            "Kelvin"{
            totalTemp = (temperatureInput - 32) * 5/9 + 273.15
        } else if defaultTemperatureInput == "Farenheit" && defaultTemperatureOutput == "Farenheit" {
            totalTemp = temperatureInput
        } else if defaultTemperatureInput == "Kelvin" && defaultTemperatureOutput == "Celsius" {
            totalTemp = temperatureInput - 273.15
        } else if defaultTemperatureInput == "Kelvin" && defaultTemperatureOutput ==
            "Farenheit"{
            totalTemp = (temperatureInput - 273.15) * 9/5 + 32
        } else if defaultTemperatureInput == "Kelvin" && defaultTemperatureOutput == "Kelvin" {
            totalTemp = temperatureInput
        }
        return totalTemp
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Temperature Input", selection: $defaultTemperatureInput){
                        ForEach (temperatureType, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    TextField("Type temperature to convert", value: $temperatureInput, format: .number)
                }
                Section("Temperature Output") {
                    Picker("Temperature Output", selection: $defaultTemperatureOutput){
                        ForEach(temperatureType, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Temperature in \(defaultTemperatureOutput)") {
                    Text("\(temperatureTotal)")
                }
                
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
