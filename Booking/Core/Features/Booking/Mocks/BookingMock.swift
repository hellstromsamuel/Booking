//
//  BookingMock.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct BookingMock {
    static let dateFormatter = ISO8601DateFormatter()
    
    static let sampleBookings: [Booking] = [
        Booking(
            id: "booking1",
            email: "samuel@email.com",
            stadiumId: "stadium1",
            time: BookingTime(
                start: "10:00",
                end: "12:30",
                dateIso: "2025-02-14"
            ),
            timeAdded: dateFormatter.date(from: "2025-01-15T20:30:00Z")!,
            title: "Booking 1",
            userId: "user1"
        ),
        Booking(
            id: "booking2",
            email: "samuel@email.com",
            stadiumId: "stadium1",
            time: BookingTime(
                start: "18:15",
                end: "20:00",
                dateIso: "2025-03-02"
            ),
            timeAdded: dateFormatter.date(from: "2025-02-27T09:15:00Z")!,
            title: "Booking 2",
            userId: "user1"
        ),
        Booking(
            id: "booking3",
            email: "samuel@email.com",
            stadiumId: "stadium2",
            time: BookingTime(
                start: "08:00",
                end: "23:59",
                dateIso: "2025-05-17"
            ),
            timeAdded: dateFormatter.date(from: "2025-03-01T09:15:00Z")!,
            title: "Test",
            userId: "user1"
        )
    ]
}
