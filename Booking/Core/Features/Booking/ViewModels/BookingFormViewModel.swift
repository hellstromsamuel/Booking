//
//  BookingFormViewModel.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import Foundation

class BookingFormViewModel: ObservableObject {
    @Published var columns: [BookingTimeSlotsColumn] = []
    
    func loadTimeSlots(stadium: Stadium) {
        let timeSlots = TimeHelper.getTimeSlots(
            startTime: "08:00",
            endTime: "20:00",
            interval: 15
        )
        let zones = ["A", "B", "C"]
        
        self.columns = BookingsHelper.generateTimeSlotsColumn(
            zones: zones,
            timeSlots: timeSlots
        )
    }
}
    
    
