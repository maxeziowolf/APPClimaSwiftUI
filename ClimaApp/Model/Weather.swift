//
//  Weather.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

import Foundation

//  "weather": [
//    {
//      "id": 804,
//      "main": "Clouds",
//      "description": "nubes",
//      "icon": "04d"
//    }
//  ],

struct Weather : Codable{
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}
