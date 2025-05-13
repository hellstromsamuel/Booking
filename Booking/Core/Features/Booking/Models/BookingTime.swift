//
//  Booking.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct BookingTime: Codable, Equatable {
    var start: String; // 10:00
    var end: String; // 12:30
    var dateIso: String; // 2025-01-15
}
