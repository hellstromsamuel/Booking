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
    
    static func generateTimeSlotsColumn(zones: [String], timeSlots: [String])
        -> [BookingTimeSlotsColumn] {
        return zones.map { zone in
            BookingTimeSlotsColumn(
                zone: zone,
                timeSlots: timeSlots.map { time in
                    BookingTimeSlot(
                        startTime: time,
                        endTime: time,
                        zone: zone
                    )
                }
            )
       }
   }
}
