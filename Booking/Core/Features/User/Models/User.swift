//
//  User.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var email: String?
    var firstName: String
    var lastName: String
    var timeAdded: Date
}

