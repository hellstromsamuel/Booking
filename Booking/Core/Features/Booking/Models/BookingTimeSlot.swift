//
//  BookingTimeSlot.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import Foundation

struct BookingTimeSlot: Codable, Equatable, Hashable {
    var startTime: String
    var endTime: String
    var zone: String
    
    var id: String {
        return startTime + endTime + zone
    }
}
