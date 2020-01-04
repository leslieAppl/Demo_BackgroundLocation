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
//    @objc dynamic public private(set) var id: Int {
//        get {
//            return self.id
//        }
//        set {
//            self.id += 1
//        }
//    }
    @objc dynamic public private(set) var timestamp: NSDate?
    @objc dynamic public private(set) var accuracy: Double = 0.0
    @objc dynamic public private(set) var speed: Double = 0.0
    @objc dynamic public private(set) var direction: Double = 0.0
    @objc dynamic public private(set) var eachDistance: Double = 0.0
    @objc dynamic public private(set) var totalDistance: Double = 0.0
    
    @objc dynamic public private(set) var isImportant = false
    @objc dynamic public private(set) var isFinished = false
    
//    override class func indexedProperties() -> [String] {
//        return ["accuracy"]
//    }
    
    convenience init(timestamp: NSDate, accuracy: Double, speed: Double, direction: Double, eachDistance: Double, totalDistance: Double) {
        self.init()
        
//        self.id = 0
        self.timestamp = timestamp
        self.accuracy = accuracy
        self.speed = speed
        self.direction = direction
        self.eachDistance = eachDistance
        self.totalDistance = totalDistance
        
        self.isImportant = false
        self.isFinished = false
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
//            print(Log().id)
//            Log().id += 1
        } catch let error {
            debugPrint(error)
        }
    }
    
    static func getAllLogs() -> Results<Log>? {
        do {
            let realm = try Realm()
            let logs = realm.objects(Log.self)
//            logs = logs.sorted(byKeyPath: "accuracy", ascending: false)
            return logs
        } catch {
            return nil
        }
    }
    
    static func upDateIsImportant(at indexPath: IndexPath) {
        do {
            let realm = try Realm()
            let objects = realm.objects(Log.self)[indexPath.row]
            
            try realm.write {
                objects.isImportant = !objects.isImportant
            }
        } catch let error {
            debugPrint(error)
        }
    }
    
//    static func getIsImportant(at indexPath: NSIndexPath) {
//        do {
//            let realm = try Realm()
//            let objects = realm.objects(Log.self)[indexPath.row]
// 
//        } catch let error {
//            debugPrint(error)
//        }
//    }
//    
    static func removeData(at indexPath: IndexPath) {
        do {
            let realm = try Realm()
            
            let objects = realm.objects(Log.self)[indexPath.row]
            
            try realm.write {
                realm.delete(objects)
            }
        } catch let error {
            debugPrint(error)
        }
    }
    
    static func removeAllData() {
        do {
            let realm = try Realm()
            
            let objects = realm.objects(Log.self)
            
            try realm.write {
                realm.delete(objects)
            }
        } catch let error {
            debugPrint(error)
        }
    }
}
