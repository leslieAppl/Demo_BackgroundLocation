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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager = LocationManager()
        locationManager?.startUpdatingLocation()

    }
}

