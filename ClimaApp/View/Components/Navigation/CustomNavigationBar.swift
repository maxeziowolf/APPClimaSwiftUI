//
//  CustomNavigationBar.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 11/07/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    public var title: String = "Menu principal"
    
    var body: some View {
        
        HStack{
            
            Spacer()
            
            Text(title)
                .font(.title)
                .bold()
            
            Spacer()
            
        }
        .padding()
        .font(.headline)
        .foregroundColor(.white)
        .background(Color.cyan)
        
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavigationBar(title: "Menu Principal")
            Spacer()
        }
    }
}
