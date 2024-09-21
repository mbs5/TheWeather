//
//  LocationManager.swift
//  Weather
//
//  Created by Muhammad Bin Sohail on 8/11/24.
//

import Foundation
import CoreLocation


// class LocationManager: This is where we're creating a new "blueprint" (called a class) for something that can manage location data.
// NSObject: This is a basic class from Apple that gives us access to a lot of useful features.
// ObservableObject: This allows our class to send out updates when something changes. For example, if the location changes, the app will know about it.
// CLLocationManagerDelegate: This means our class can handle events related to location, like when the location changes or when there’s an error.


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    // a manager that will handle getting the user's location. as a helper that can find out where you are
    let manager = CLLocationManager()
    
//    @Published: This means that if these variables change, the rest of the app that cares about them will automatically update.
//    var location: CLLocationCoordinate2D?: This will store the user's location (latitude and longitude). The question mark (?) means it might be empty at first.
//    var isLoading = false: This is a simple yes/no variable that tells us if the app is currently trying to get the user's location.

    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        
        super.init()
        
        // manager.delegate = self: This tells our location manager to report back to us (the LocationManager class) when it finds something out.
        manager.delegate = self
    }
    
    func requestLocation() {
        
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error loading location", error)
        isLoading = false
        
    }
}
