
//
//  BookingTimeSlotsColumn.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingTimeSlotsColumn: View {
    var zone: String
    var timeSlots: [String] = []
    var onPressTimeSlot: (BookingTimeSlot) -> Void
    var selectedTimeSlots: [BookingTimeSlot] = []
    
    func isSelected(timeSlot: BookingTimeSlot) -> Bool {
        var selectedSlot: BookingTimeSlot? {
            selectedTimeSlots.first(
                where: { $0.id == timeSlot.id}
            )
        }
        return selectedSlot != nil
    }
    
    func isDisabled(timeSlot: BookingTimeSlot) -> Bool {
        return false
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(timeSlots, id: \.self) { timeSlot in
                BookingTimeSlotView(
                    timeSlot: timeSlot,
                    zone: zone,
                    selected: isSelected(
                        timeSlot: BookingTimeSlot(
                            startTime: timeSlot,
                            endTime: timeSlot,
                            zone: zone
                        )
                    ),
                    disabled: false,
                    action: {
                        onPressTimeSlot(
                            BookingTimeSlot(
                                startTime: timeSlot,
                                endTime: timeSlot,
                                zone: zone
                            )
                        )
                    }
                )
            }
        }
    }
}

struct BookingTimeSlotsColumn_Previews: PreviewProvider {
    static var previews: some View {
        BookingTimeSlotsColumn(
            zone: "A",
            timeSlots: TimeHelper.getTimeSlots(startTime: "08:00", endTime: "20:00", interval: 15),
            onPressTimeSlot: { selectedTime in
                         print("Selected time: \(selectedTime)")
                     },
            selectedTimeSlots: []
        )
    }
}
