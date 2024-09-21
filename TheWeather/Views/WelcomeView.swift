//
//  WelcomeView.swift
//  Weather
//
//  Created by Muhammad Bin Sohail on 8/12/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    
    
    var body: some View {
        VStack {
            
            VStack (spacing: 20) {
                Text("Welcome to the Weather App")
                    .font(.title).bold()
                Text("Please share your current location to get the weather in you area")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(20)
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation)
            {
                locationManager.requestLocation()
                
            }
            .foregroundColor(.white)
            .cornerRadius(20)
            .symbolVariant(.fill)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
        
#Preview {
    WelcomeView()
}
