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
        
        GeometryReader { proxy in
            
            VStack (spacing: 0){
                
                CardWeather(weatherViewModel: weatherViewModel, proxy: proxy)
                
                Spacer()
            }

            
        }
        .task (){
            
            await weatherViewModel.getWeather()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
