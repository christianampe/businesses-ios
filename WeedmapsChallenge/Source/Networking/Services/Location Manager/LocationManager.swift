//
//  LocationManager.swift
//  WeedmapsChallenge
//
//  Created by Christian Ampe on 5/26/19.
//  Copyright © 2019 Weedmaps, LLC. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    private static let locationManager = CLLocationManager()
    
    static var location: CLLocation? {
        return locationManager.location
    }
    
    static func requestAccess() {
        locationManager.requestWhenInUseAuthorization()
    }
}
