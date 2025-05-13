//
//  StadiumDetailsViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class StadiumDetailsViewModel: ObservableObject {
    @Published var timeSlots: [String] = []

    func loadTimeSlots(startTime: String, endTime: String, interval: Int) {
        timeSlots = TimeHelper.getTimeSlots(startTime: startTime, endTime: endTime, interval: interval)
    }
}
