//
//  BookingDetailsView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingDetailsView: View {
    let booking: Booking
    
    var body: some View {
        List {
        Section(header: Text("Details")) {
                HStack {
                    Text("Title")
                        .font(.headline)
                    Spacer()
                    Text(booking.title)
                }
                HStack {
                    Text("Date")
                        .font(.headline)
                    Spacer()
                    Text(booking.time.dateIso)
                }
                HStack {
                    Text("Start time")
                        .font(.headline)
                    Spacer()
                    Text(booking.time.start)
                }
                HStack {
                    Text("End time")
                        .font(.headline)
                    Spacer()
                    Text(booking.time.end)
                }
                HStack {
                    Text("Stadium")
                        .font(.headline)
                    Spacer()
                    Text(booking.stadiumId)
                }
                HStack {
                    Text("Email")
                        .font(.headline)
                    Spacer()
                    Text(booking.email)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Booking")
    }
}

struct BookingDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailsView(booking: BookingMock.sampleBookings[0])
    }
}
