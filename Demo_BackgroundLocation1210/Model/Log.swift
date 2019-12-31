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
    
//    override class func indexedProperties() -> [String] {
//        return ["accuracy"]
//    }
    
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
        // init Log self to realm database
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
    
    static func getAllLogs() -> Results<Log>? {
        do {
            let realm = try Realm()
            var logs = realm.objects(Log.self)
//            logs = logs.sorted(byKeyPath: "accuracy", ascending: false)
            return logs
        } catch {
            return nil
        }
    }
}
