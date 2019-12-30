//
//  ViewController.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/10/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: LocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager()
        Log.printFileURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        locationManager?.startUpdatingLocation()

    }
    
    func startLocationLog() {
        locationManager?.startUpdatingLocation()
    }
    
    func pauseLocationLog() {
        locationManager?.pauseUpdatingLocation()
    }
    
    func stopLocationLog() {
        locationManager?.stopUpdatingLocation()
    }
    
    @IBAction func startLogBtnPressed(_ sender: Any) {
        startLocationLog()
    }
    
    @IBAction func pauseLogBtnPressed(_ sender: Any) {
        pauseLocationLog()
    }
    
    @IBAction func stopLogBtnPressed(_ sender: Any) {
        stopLocationLog()
    }
}

