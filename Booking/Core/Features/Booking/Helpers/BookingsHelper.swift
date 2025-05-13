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
}
