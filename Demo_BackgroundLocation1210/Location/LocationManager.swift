//
//  LocationManager.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/10/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    // Location variables
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var totalDistance: Double = 0.0
    
    // Location Log variables
    var logTimestamp: NSDate?
    var logAccuracy: Double = 0.0
    var logSpeed: Double = 0.0
    var logDirection: Double = 0.0
    var eachDistance: Double = 0.0
    
    // MARK: - Lifecycle Methods
    
    override init() {
        super.init()
        
        print("Initializing Location Manager: \(self)")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .fitness
        locationManager.distanceFilter = 10
        
        // Background Mode Setting...
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.showsBackgroundLocationIndicator = true
//        locationManager.distanceFilter = kCLDistanceFilterNone // default
        
        // TODO: Also use a timer?
    }
    
    deinit {
        
        print("Location Manager de-initialized: \(self)")
        
        locationManager.delegate = nil
    }
    
    // MARK: - Process Methods
    
    func startUpdatingLocation() {
        let auth = CLLocationManager.authorizationStatus()
        if auth == .denied {
            print("Location Service Permissions Are Disabled")
            locationManager.requestWhenInUseAuthorization()
        } else {
            print("Starting To Monitor Location Updates")
            locationManager.requestAlwaysAuthorization()
            
            locationManager.startUpdatingLocation()
        }
    }
    
    func pauseUpdatingLocation() {
        startLocation = nil
        locationManager.stopUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        totalDistance = 0.0
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.logTimestamp = locations.last?.timestamp as NSDate? // time
        self.logAccuracy = locations.last!.horizontalAccuracy // meters
        self.logSpeed = ((locations.last!.speed * 3600) / 1000)
        self.logDirection = locations.last!.course // degrees and relative to due north
        
        print(logTimestamp!)
        print("logAccuracy: \(logAccuracy)")
        print("logSpeed: \(logSpeed)")
        print("logDirection: \(logDirection)")
        
        if startLocation == nil {
            startLocation = locations.first // 'startLocation' initializing
        } else if let location = locations.last {
            eachDistance = lastLocation.distance(from: location) // meters
            print(">> eachDistance: \(eachDistance)")
            totalDistance += lastLocation.distance(from: location)
            print(">> runDistance: \(totalDistance)")
        }
        lastLocation = locations.last // don't miss storing 'lastLocation'.
        
        Log.addLogToRealm(timestamp: self.logTimestamp!, accuracy: self.logAccuracy, speed: self.logSpeed, direction: self.logDirection, eachDistance: self.eachDistance, totalDistance: self.totalDistance)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error! \(error)")
    }
}
