//
//  BookingTimeSlot.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import Foundation

struct BookingTimeSlot: Codable, Equatable, Hashable {
    var startTime: String // 10:00
    var endTime: String // 20:00
    var zone: String // "A"
    
    var id: String {
        return startTime + endTime + zone
    }
}
