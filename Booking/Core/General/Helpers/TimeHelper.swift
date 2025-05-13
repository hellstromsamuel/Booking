//
//  MainTabView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct TimeHelper {
    /// Returns an array of time slots between a start and end time, with a given interval.
    ///
    /// Parameters:
    /// - startTime: The start time of the time slots.
    /// - endTime: The end time of the time slots.
    /// - interval: The interval between the time slots.
    ///
    /// Returns:
    /// An array of time slots.
    ///
    /// Example:
    /// startTime: "10:00"
    /// returns: ["10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00", "12:15"]
    static func getTimeSlots(startTime: String, endTime: String, interval: Int) -> [String] {        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let startDate = dateFormatter.date(from: startTime),
              let endDate = dateFormatter.date(from: endTime) else {
            return []
        }
        
        var timeSlots: [String] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            timeSlots.append(dateFormatter.string(from: currentDate))
            currentDate = Calendar.current.date(byAdding: .minute, value: interval, to: currentDate) ?? currentDate
        }
        
        return timeSlots
    }
}
