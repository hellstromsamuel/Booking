//
//  BookingsListItem.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingsListItem: View {
    let booking: Booking
    
    var formattedBookingTime: String {
        return booking.time.dateIso + ", " + booking.time.start + "-" + booking.time.end
    }
    
    var body: some View {
        VStack(alignment: .leading) {
           Text(booking.title)
               .font(.headline)
            Text(formattedBookingTime)
       }
    }
}

struct BookingsListItem_Previews: PreviewProvider {
    static var previews: some View {
        BookingsListItem(booking: BookingMock.sampleBookings[0])
    }
}
