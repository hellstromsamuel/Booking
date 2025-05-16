//
//  BookingSelectTimeSlots.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingSelectTimeSlots: View {
    var selectedTimeSlots: [BookingTimeSlot] = []
    var timeSlots: [String] = []
    var zones: [String] = []
    var onPressTimeSlot: (BookingTimeSlot) -> Void
    var onPressContinue: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                ForEach(zones, id: \.self) { zone in
                    Text(zone)
                        .frame(maxWidth: .infinity)
                }
            }
            
            ScrollView {
                HStack {
                    ForEach(zones, id: \.self) { zone in
                        BookingTimeSlotsColumn(
                            zone: zone,
                            timeSlots: timeSlots,
                            onPressTimeSlot: onPressTimeSlot,
                            selectedTimeSlots: selectedTimeSlots
                        )
                    }
                }
            }
            
            PrimaryButton(
                text: "Continoue",
                action: onPressContinue
            )
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

struct BookingSelectTimeSlots_Previews: PreviewProvider {
    static var previews: some View {
        BookingSelectTimeSlots(
            selectedTimeSlots: [],
            timeSlots: TimeHelper.getTimeSlots(startTime: "08:00", endTime: "20:00", interval: 15),
            zones: ["A", "B", "C"],
            onPressTimeSlot: { selectedTime in
                         print("Selected time: \(selectedTime)")
                     },
            onPressContinue: {
                print("Continue")
            }
        )
    }
}
