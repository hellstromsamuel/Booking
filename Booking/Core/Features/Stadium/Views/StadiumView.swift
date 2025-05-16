//
//  StadiumView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

enum Route: Hashable {
    case booking
}

struct StadiumView: View {
    let stadium: Stadium
    
    @State var showBookingSheet: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Information")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(stadium.name)
                    }
                }
                
                Section(header: Text("Booking")) {
                    Text("You can easily book time \(stadium.name) with this app.")
                    PrimaryButton(
                        text: "Book available time",
                        action: {
                            showBookingSheet = true
                        }
                    )
                }
            }
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .booking:
                BookingFormView(stadium: stadium)
            }
        }
        .navigationTitle(stadium.name)
        .sheet(isPresented: $showBookingSheet) {
            NavigationStack {
                BookingFormView(stadium: stadium)
            }
        }
    }
}

struct StadiumView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumView(stadium: StadiumMock.sampleStadiums[0])
    }
}
