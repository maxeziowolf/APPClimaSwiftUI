//
//  Sys.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 29/06/22.
//

import Foundation

//    "type": 1,
//    "id": 8152,
//    "country": "PH",
//    "sunrise": 1656451802,
//    "sunset": 1656498642

struct Sys: Codable {
    
    let type: Int
    let sunrise: Date
    let sunset: Date
    
    
}
