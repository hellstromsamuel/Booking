//
//  Booking.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct Booking: Identifiable, Codable, Equatable, Hashable {
    var id: String
    var email: String
    var stadiumId: String
    var time: BookingTime
    var timeAdded: Date
    var title: String
    var userId: String
}

