//
//  CustonNavigationBarContainer.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 11/07/22.
//

import SwiftUI

struct CustonNavigationBarContainer<Content: View> : View {
    
    let content: Content
    
    init( @ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            CustomNavigationBar(title: "Menu principal")
            
            content
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
        }
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        
    }
}

struct CustonNavigationBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustonNavigationBarContainer {
            
            ContentView()
            
        }
    }
}
