//
//  HomeViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var stadiums: [Stadium] = StadiumMock.sampleStadiums

    func loadUserData() {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.user = UserMock.sampleUsers[0]
        }
    }
}
