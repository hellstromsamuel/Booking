//
//  BookingsList.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingsList: View {
    let bookings: [Booking]
    
    var body: some View {
        List {
            ForEach(bookings, id: \.id) { booking in
                NavigationLink(destination: BookingDetailsView(booking: booking)) {
                    BookingsListItem(booking: booking)
                }
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .listStyle(.plain)
        .animation(.default, value: bookings)
    }
}

struct BookingsList_Previews: PreviewProvider {
    static var previews: some View {
        BookingsList(bookings: BookingMock.sampleBookings)
    }
}
