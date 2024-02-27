//
//  LocationManager.swift
//  SwiftLearning
//
//  Created by Gagandeep on 11/01/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

enum LocationError: Error{
    case Unknown
    case HeadingUnavailable
}

class LocationManager: NSObject {
    
    private let locationManager: CLLocationManager
    private var compassHeading: Double?

    override init() {
        self.locationManager = CLLocationManager()
        super.init()
            
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func getMagneticHeading() -> Future<Double, LocationError> {
        return Future() { promise in
            if !CLLocationManager.headingAvailable() {
                print("LocationManager : Heading not available.")
                return promise(Result.failure(LocationError.HeadingUnavailable))
            }
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
            print("LocationManager : Requeted location updates. Now waiting for 5s heading.")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if let value = self.compassHeading {
                    self.compassHeading = nil
                    return promise(Result.success(value))
                } else {
                    return promise(Result.failure(LocationError.HeadingUnavailable))
                }
            }
        }
    }
    
    func calculateInitialBearing(from coordinate1: CLLocationCoordinate2D, to coordinate2: CLLocationCoordinate2D) -> Double {
        let lat1 = coordinate1.latitude.degreesToRadians
        let lon1 = coordinate1.longitude.degreesToRadians
        let lat2 = coordinate2.latitude.degreesToRadians
        let lon2 = coordinate2.longitude.degreesToRadians

        let dLon = lon2 - lon1

        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)

        var bearing = atan2(y, x).radiansToDegrees
        bearing = (bearing + 360).truncatingRemainder(dividingBy: 360)

        return bearing
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("Got Heading from location \(newHeading.magneticHeading)")
        self.compassHeading = -1 * newHeading.magneticHeading
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coord1 = locations.last?.coordinate
        let coord2 = CLLocationCoordinate2D(latitude: 21.4225, longitude: 39.8262)
        let diff = calculateInitialBearing(from: coord1!, to: coord2)
        print("initiaal bearing \(diff)")
    }
}

fileprivate extension Double {
    var degreesToRadians: Double { return self * .pi / 180.0 }
    var radiansToDegrees: Double { return self * 180.0 / .pi }
}
