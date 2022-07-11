//
//  CardWeather.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 11/07/22.
//

import SwiftUI

struct CardWeather: View {
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    public var proxy: GeometryProxy?
    
    var body: some View {
        
        ZStack {
            
            Image("sky.without.clouds")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack{
                
                Text("\( weatherViewModel.weatherResponseDataModel.city)")
                    .font(.system(size: 30,design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.white)
                
                Text("\(weatherViewModel.weatherResponseDataModel.description)")
                    .font(.system(size: 15,design: .rounded))
                    .padding(.bottom, 8)
                    .foregroundColor(.white)
                
                HStack (spacing: 10){
                    
                    if let url = weatherViewModel.weatherResponseDataModel.iconURL {
                        
                        
                        AsyncImage(url: url, content: { image in
                            
                            image
                            
                        }) {
                            ProgressView()
                        }
                        .frame(maxWidth: 20, maxHeight: 20)
                        
                    }
                    
                    
                    Label("\(weatherViewModel.weatherResponseDataModel.humidity)", systemImage: "humidity.fill")
                        .symbolRenderingMode(.multicolor)
                        .padding()
                        .foregroundColor(.white)
                    
                }
                
                
                HStack{
                    
                    Text("\(weatherViewModel.weatherResponseDataModel.currentTemperature)")
                        .font(.system(size: 50,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                    
                    VStack{
                        
                        HStack{
                            
                            Label("\(weatherViewModel.weatherResponseDataModel.maxTemperature)", systemImage: "thermometer.sun.fill")
                            
                            Label("\(weatherViewModel.weatherResponseDataModel.minTemperature)", systemImage: "thermometer.snowflake")
                            
                        }
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                        
                        Divider()
                        
                        HStack{
                            
                            Image(systemName: "sunrise.fill")
                            
                            Text(weatherViewModel.weatherResponseDataModel.sunRise, style: .time)
                            
                            Image(systemName: "sunset.fill")
                            
                            Text(weatherViewModel.weatherResponseDataModel.sunSet, style: .time)
                            
                        }
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                        
                    }
                    
                }
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .cornerRadius(20)
        .padding()
        .shadow(color: .red, radius: 2, x: 0, y: 0)
    }
}

struct CardWeather_Previews: PreviewProvider {
    static var previews: some View {
        CardWeather()
            .previewLayout(.sizeThatFits)
    }
}
