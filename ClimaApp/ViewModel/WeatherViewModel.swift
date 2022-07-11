//
//  WeatherViewModel.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

import Foundation
import CoreLocation

// https://api.openweathermap.org/data/2.5/weather?appid=89e877851660b7c2a4c2d4111688139a&q=mexico&units=metric&lang=es

// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

final class WeatherViewModel: ObservableObject {
    
    //MARK: Atributtes
    private var urlBase = "https://api.openweathermap.org/"
    //private var cityName = "lerma"
    private var latitud = 19.3003889
    private var longitud = -99.2009923
    private var apiKey = "89e877851660b7c2a4c2d4111688139a"
    private var units = "metric"
    private var lenguage = "es"
    
    //MARK: Publish Atributes
    @Published var weatherResponseDataModel: WeatherModel = .empty
    
    public func getWeather() async {
        
        //let url = URL(string: "\(urlBase)/data/2.5/weather?appid=\(apiKey)&q=\(cityName)&units=\(units)&lang=\(lenguage)")
        let url = URL(string: "\(urlBase)/data/2.5/weather?lat=\(latitud)&lon=\(longitud)&appid=\(apiKey)&units=\(units)&lang=\(lenguage)")
        
        
        do {
            
            guard let urlU = url else{
                return
            }
            
            async let (data, _) = try await URLSession.shared.data(from: urlU)
            
            try await print(data.debugDescription)
            
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherResponseDataModel = WeatherModelWapper.mapDataModelToModel(dataModel: dataModel)
            }
            
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
    }
    
    public func setupLocation(location: CLLocation){
        
        latitud = location.coordinate.latitude
        longitud = location.coordinate.longitude
        
        
    }
}
