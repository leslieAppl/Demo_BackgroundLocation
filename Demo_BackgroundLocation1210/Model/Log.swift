//
//  Log.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/30/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class Log: Object {
    @objc dynamic public private(set) var timestamp: NSDate?
    @objc dynamic public private(set) var accuracy: Double = 0.0
    @objc dynamic public private(set) var speed: Double = 0.0
    @objc dynamic public private(set) var direction: Double = 0.0
    @objc dynamic public private(set) var eachDistance: Double = 0.0
    @objc dynamic public private(set) var totalDistance: Double = 0.0
    
    convenience init(timestamp: NSDate, accuracy: Double, speed: Double, direction: Double, eachDistance: Double, totalDistance: Double) {
        self.init()
        
        self.timestamp = timestamp
        self.accuracy = accuracy
        self.speed = speed
        self.direction = direction
        self.eachDistance = eachDistance
        self.totalDistance = totalDistance
    }
    static func printFileURL() {
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    static func addLogToRealm(timestamp: NSDate, accuracy: Double, speed: Double, direction: Double, eachDistance: Double, totalDistance: Double) {
        let log = Log(timestamp: timestamp, accuracy: accuracy, speed: speed, direction: direction, eachDistance: eachDistance, totalDistance: totalDistance)
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(log)
            }
        } catch let error {
            debugPrint(error)
        }
    }
}
