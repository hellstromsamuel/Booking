//
//  BookingTimeSlotsColumn.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import Foundation

struct BookingTimeSlotsColumn: Codable, Equatable, Hashable {
    var zone: String
    var timeSlots: [BookingTimeSlot]
}
