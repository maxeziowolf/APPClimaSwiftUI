//
//  UIUtilCoreLocation.swift
//  ClimaApp
//
//  Created by Maximiliano Ovando Ramirez on 29/06/22.
//

import CoreLocation

final class LocationViewModel: NSObject ,ObservableObject{
    
    private let locationManager: CLLocationManager = .init()
    
    @Published var location = CLLocation()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        self.location = location
        
        print("Location \(location)")
    }
    
}
