//
//  AppDelegate.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/10/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var locationManager: LocationManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let options = launchOptions, let _ = options[UIApplication.LaunchOptionsKey.location] {
            print("Launched by location")
        }
        
//        locationManager = LocationManager()
//        locationManager?.startUpdatingLocation()
        
        return true
    }

}

