//
//  MainTabView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack {
            // The main tab view content
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(1)

                BookingsHistoryView()
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Bookings")
                    }
                    .tag(2)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
