//
//  WeatherResponseDataModel.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

//MARK: JSON Example
//{
//  "weather" [],
//  "main"{},
//  "visibility": 10000,
//  "wind": {},
//  "clouds": {
//    "all": 100
//  },
//  "dt": 1656454524,
//  "sys": {},
//  "timezone": 28800,
//  "id": 1699805,
//  "name": "Mexico",
//  "cod": 200
//}


import Foundation

struct WeatherResponseDataModel: Codable{
    
    let cityName: String
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let sun: Sys
    let timezone: Double
    
    enum CodingKeys: String, CodingKey {
        case cityName = "name", weather, main, wind, sun = "sys", timezone
    }
    
}
