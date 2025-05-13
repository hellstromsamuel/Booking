//
//  UserMock.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct UserMock {
    static let dateFormatter = ISO8601DateFormatter()
    
    static let sampleUsers: [User] = [
        User(
            id: "user1",
            email: "samuel@email.com",
            firstName: "Samuel",
            lastName: "Hellstrøm",
            timeAdded: dateFormatter.date(from: "2025-01-01T12:00:00Z")!
        )
    ]
}
