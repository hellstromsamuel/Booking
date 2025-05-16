//
//  BookingsViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class BookingsViewModel: ObservableObject {
    @Published var bookings: [Booking] = BookingsHelper.sortBookings(
        direction: .ascending,
        by: \.timeAdded,
        from: BookingMock.sampleBookings)
}
