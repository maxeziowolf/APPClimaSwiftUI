//
//  Winf.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

import Foundation

//"wind": {
//    "speed": 1.89,
//    "deg": 125,
//    "gust": 3.66
//  },
    
struct Wind : Codable{
    
    let speed: Double
    let deg: Int
    let gust: Double
}
