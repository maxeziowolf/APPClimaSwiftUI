//
//  WeatherModel.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 29/06/22.
//

import Foundation

struct WeatherModel {
    
    let city: String
    let wather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    let sunRise: Date
    let sunSet: Date
    
    
    static let empty:  WeatherModel = .init(
        city: "No ciudad",
        wather: "Sin clima",
        description: "No tiene descripcion",
        iconURL: nil,
        currentTemperature: "0°",
        minTemperature: "0°",
        maxTemperature: "0°",
        humidity: "0%",
        sunRise: .now,
        sunSet: .now
    )
    
}
