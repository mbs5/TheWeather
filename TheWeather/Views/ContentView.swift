//
//  ContentView.swift
//  Weather
//
//  Created by Muhammad Bin Sohail on 8/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @State var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(longitude: location.longitude, latitude: location.latitude)
                            } catch {
                                errorMessage = "Error getting Weather: \(error.localizedDescription)"
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
        }
        .background(Color(hue: 0.683, saturation: 0.781, brightness: 0.443))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
