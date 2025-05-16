//
//  BookingsHelper.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class BookingsHelper {
    static func sortBookings<T: Comparable>(
           direction: SortDirection,
           by keyPath: KeyPath<Booking, T>,
           from bookings: [Booking]
       ) -> [Booking] {
           switch direction {
           case .ascending:
               return bookings.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
           case .descending:
               return bookings.sorted { $0[keyPath: keyPath] > $1[keyPath: keyPath] }
           }
       }
    
    static func formatTimeText(
        startTime: String,
        endTime: String
    ) -> String {
        if startTime.isEmpty || endTime.isEmpty {
            return ""
        }
        return startTime + " - " + endTime
    }
    
    static func getTimeSlotsHelpText(
        startTime: String,
        endTime: String
    ) -> String {
        if startTime.isEmpty || endTime.isEmpty {
            return "Choose timeslots"
        }
        return formatTimeText(startTime: startTime, endTime: endTime)
    }
    
    static func updateFromTimeSlot(
        timeSlot: String,
        startTime: String,
        endTime: String
    ) -> (String, String) {
        // If clicking already selected start time, reset both
        if timeSlot == startTime {
            return ("", "")
        }
        
        // If clicking already selected end time, just reset end time
        if timeSlot == endTime {
            return (startTime, "")
        }
        
        // If no start time set, set it
        if startTime.isEmpty {
            return (timeSlot, endTime)
        }
        
        // If start time is set but no end time, set end time if valid
        if endTime.isEmpty {
            // Only set end time if after start time
            if timeSlot > startTime {
                return (startTime, timeSlot)
            } else {
                // If before start time, make this new start time
                return (timeSlot, endTime)
            }
        }
        
        // If both times set, start new selection
        return (timeSlot, "")
    }
}
