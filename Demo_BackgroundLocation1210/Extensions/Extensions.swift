//
//  Extensions.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/31/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import Foundation
extension Double {
    
    // Double To Int
    func toInt() -> Int? {
        // nextDown: For any finite value x, x.nextDown is less than x.
        // nextUp: For any finite value x, x.nextUp is greater than x
        guard (self <= Double(Int.max).nextDown) && (self >= Double(Int.min).nextUp) else {
            return nil
        }

        return Int(self)
    }
    
    // Return Double
    func metersToKm(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ((self / 1000) * divisor).rounded() / divisor
    }
    
    // Return String with fixed 2 decimal
    func metersToKmForString(places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = places
        formatter.maximumFractionDigits = places
        formatter.roundingMode = .halfUp
        
        let km = self / 1000
        let stringKm = formatter.string(for: km)
        return stringKm!
    }
    
    // Return String to show Kilometers in 2 decimal places using NumberFormatter
    func setDecimalPlaces(places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = places
        formatter.maximumFractionDigits = places
        formatter.roundingMode = .halfUp
        
        let m = self
        let stringKm = formatter.string(for: m)
        return stringKm!
    }
    
    func setDecimalPlaces(places: Int) -> Double {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = places
        formatter.maximumFractionDigits = places
        formatter.roundingMode = .halfUp
        
        return self
    }
}

extension Int {
    func formatTimeDurationToString() -> String {
        // 'self' is the object to recieve the massages sent to it with message sending dot-notation.
        // Because their type is Int, in the 'durationMinutes': 59 / 60 = 0 min; 61 / 60 = 1 min;
        let durationHours = self / 3600
        let durationMinutes = (self % 3600) / 60
        let durationSeconds = (self % 3600) % 60
        
        if durationSeconds < 0 {
            return "00:00"
        } else {
            if durationHours == 0 {
                // "%02d:%02d" in where 'd' stands for type Double.
                return String(format: "%02d:%02d", durationMinutes, durationSeconds)
            } else {
                return String(format: "%02d:%02d:%02d", durationHours, durationMinutes, durationSeconds)
            }
        }
    }
}

extension NSDate {
    func formatDateToString() -> String {
        let today = self as Date
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: today)
    }
    
    func getDateString() -> String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self as Date)
        let day = calendar.component(.day, from: self as Date)
        let year = calendar.component(.year, from: self as Date)
        let hour = calendar.component(.hour, from: self as Date)
        let minute = calendar.component(.minute, from: self as Date)
        
        return "\(month)/\(day)/\(year) \(hour):\(minute)"
    }
}
