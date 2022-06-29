//
//  WeatherModelMapper.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 29/06/22.
//

import Foundation

struct WeatherModelWapper {
    
    static func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel{
        
        guard let weather = dataModel.weather.first else{
            return .empty
        }
        
        let temperature = dataModel.main ?? Main(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0
        )
        
        let sunsetWithTimezone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone ?? 0 - Double(TimeZone.current.secondsFromGMT()))
        let sunriseWithTimezone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone ?? 0 - Double(TimeZone.current.secondsFromGMT()))
        
        return WeatherModel(
                            city: dataModel.cityName ?? "No ciudad",
                            wather: weather.main,
                            description: ("(\(weather.description.capitalized))"),
                            iconURL: URL(string: "https://api.openweathermap.org/img/w/\(weather.icon).png"),
                            currentTemperature: "\(Int(temperature.temp))°",
                            minTemperature: "\(Int(temperature.tempMin))° min.",
                            maxTemperature: "\(Int(temperature.tempMax))° max.",
                            humidity: "\(temperature.humidity) %",
                            sunRise: sunriseWithTimezone ?? .now, 
                            sunSet: sunsetWithTimezone ?? .now
                            
        )
        
    }
    
}
