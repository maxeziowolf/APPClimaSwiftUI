//
//  Main.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

import Foundation

//  "main": {
//    "temp": 25.84,
//    "feels_like": 26.93,
//    "temp_min": 25.84,
//    "temp_max": 25.84,
//    "pressure": 1004,
//    "humidity": 94,
//  },

struct Main : Codable{
    
    let temp : Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp,
             feelsLike = "feels_like",
             tempMin = "temp_min",
             tempMax = "temp_max",
             pressure,
             humidity
    }
}
