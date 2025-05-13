//
//  UserProfileViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String?
    @Published var notificationsEnabled: Bool = false
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    func loadProfileData() {
        let user = UserMock.sampleUsers[0]
        self.name = user.firstName + " " + user.lastName
        self.email = user.email
        self.notificationsEnabled = true
    }
}
