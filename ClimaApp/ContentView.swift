//
//  ContentView.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 28/06/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Text("\( weatherViewModel.weatherResponseDataModel.city)")
                    .foregroundColor(.white)
                    .font(.system(size: 70,design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    
                
                Text("\(weatherViewModel.weatherResponseDataModel.description)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.bottom, 8)
                
                HStack{
                    
                    if let url = weatherViewModel.weatherResponseDataModel.iconURL {
                        
                        
                        AsyncImage(url: url, content: { image in
                            
                            image
                            
                        }) {
                            ProgressView()
                        }
                        
                    }
                    
                    Text("\(weatherViewModel.weatherResponseDataModel.currentTemperature)")
                        .foregroundColor(.white)
                        .font(.system(size: 70,design: .rounded))
                        .bold()
                    
                }
                .padding(.top, -20)
                
                HStack{
                    
                    Label("\(weatherViewModel.weatherResponseDataModel.maxTemperature)", systemImage: "thermometer.sun.fill")
                    Label("\(weatherViewModel.weatherResponseDataModel.minTemperature)", systemImage: "thermometer.snowflake")
                    
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                
                Divider()
                    .foregroundColor(.white)
                    .padding()
                
                HStack{
                    
                    Image(systemName: "sunrise.fill")
                    
                    Text(weatherViewModel.weatherResponseDataModel.sunRise, style: .time)
                    
                    Image(systemName: "sunset.fill")
                    
                    Text(weatherViewModel.weatherResponseDataModel.sunSet, style: .time)
                    
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                
                Divider()
                    .foregroundColor(.white)
                    .padding()
                
                Label("\(weatherViewModel.weatherResponseDataModel.humidity)", systemImage: "humidity.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                
                Spacer()
                
                
                
            }
            .padding(.top, 32)
            
            
            
        }
        .background(
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .task {
            await weatherViewModel.getWeather()
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
