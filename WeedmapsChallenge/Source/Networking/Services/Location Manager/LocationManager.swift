//
//  LocationManager.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/26/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    private let locationManager: CLLocationManager

    private override init() {
        locationManager = CLLocationManager()
        super.init()
    }
    
    static let shared: LocationManager = {
        return LocationManager()
    }()
}

extension LocationManager {
    var location: CLLocation? {
        return locationManager.location
    }
    
    func setup() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        
    }
}
