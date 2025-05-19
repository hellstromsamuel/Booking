
//
//  BookingTimeSlotsColumn.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingTimeSlotsColumnView: View {
    var column: BookingTimeSlotsColumn
    var onPressTimeSlot: (BookingTimeSlot) -> Void
    var selectedTimeSlots: [BookingTimeSlot] = []
    
    func isSelected(timeSlot: BookingTimeSlot) -> Bool {
        return BookingTimeSlotsHelper.isTimeSlotSelected(
            timeSlot: timeSlot,
            selectedTimeSlots: selectedTimeSlots
        )
    }
    
    func isDisabled(timeSlot: BookingTimeSlot) -> Bool {
        return false
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(column.timeSlots, id: \.self) { timeSlot in
                BookingTimeSlotView(
                    timeSlot: timeSlot,
                    selected: isSelected(
                        timeSlot: timeSlot
                    ),
                    disabled: false,
                    action: {
                        onPressTimeSlot(timeSlot)
                    }
                )
            }
        }
    }
}

struct BookingTimeSlotsColumnView_Previews: PreviewProvider {
    static var previews: some View {
        BookingTimeSlotsColumnView(
            column: BookingTimeSlotsHelper.generateTimeSlotsColumns(
                zones: ["A"],
                startTime: "10:00",
                endTime: "20:00",
                interval: 15
            )[0],
            onPressTimeSlot: { selectedTime in
                         print("Selected time: \(selectedTime)")
                     },
            selectedTimeSlots: []
        )
    }
}
