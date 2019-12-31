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
    @IBOutlet weak var logTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager()
        Log.printFileURL()
//        print("here are my Logs: \(Log.getAllLogs())")
        
        logTableView.delegate = self
        logTableView.dataSource = self
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Log.getAllLogs()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LogCellView") as? LogCellView {
            guard let log = Log.getAllLogs()?[indexPath.row] else {
                return LogCellView()
            }
            cell.configureLogCell(log: log)
            return cell
        } else {        
            return LogCellView()
        }
    }
}
