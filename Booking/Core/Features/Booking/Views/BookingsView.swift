//
//  BookingsView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingsView: View {
    var body: some View {
        NavigationStack {
            BookingsHistoryView()
                .navigationTitle("Bookings")
        }
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
}



