//
//  BookingApp.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

@main
struct BookingApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    init() {
        // Set background color on TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.systemBackground

        UITabBar.appearance().standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView().preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
