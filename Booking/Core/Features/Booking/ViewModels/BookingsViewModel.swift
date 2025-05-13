//
//  BookingsViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class BookingsViewModel: ObservableObject {
    @Published var bookings: [Booking] = []

    func loadBookings() {
        let sampleBookings = BookingMock.sampleBookings;
        bookings = BookingsHelper.sortBookings(
            direction: .ascending,
            by: \.timeAdded,
            from: sampleBookings)
    }
}
