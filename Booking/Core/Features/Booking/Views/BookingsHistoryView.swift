//
//  BookingHistoryView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingsHistoryView: View {
    @ObservedObject var viewModel = BookingsViewModel()
    @State private var searchText: String = ""
    
    var filteredBookings: [Booking] {
           if searchText.isEmpty {
               return viewModel.bookings
           } else {
               return viewModel.bookings.filter {
                   $0.title.localizedCaseInsensitiveContains(searchText)
               }
           }
       }
    
    var body: some View {
        BookingsList(bookings: filteredBookings)
            .searchable(text: $searchText)
    }
}

struct BookingsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsHistoryView()
    }
}
