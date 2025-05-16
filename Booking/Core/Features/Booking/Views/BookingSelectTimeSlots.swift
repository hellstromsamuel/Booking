//
//  BookingSelectTimeSlots.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingSelectTimeSlots: View {
    var selectedTimeSlots: [BookingTimeSlot] = []
    var columns: [BookingTimeSlotsColumn] = []
    var onPressTimeSlot: (BookingTimeSlot) -> Void
    var onPressContinue: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                ForEach(columns, id: \.zone) { column in
                    Text(column.zone)
                        .frame(maxWidth: .infinity)
                }
            }
            
            ScrollView {
                HStack {
                    ForEach(columns, id: \.zone) { column in
                        BookingTimeSlotsColumnView(
                            column: column,
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
    struct PreviewWrapper: View {
        @State private var selectedTimeSlots: [BookingTimeSlot] = []
        
        func toggleTimeSlot(timeSlot: BookingTimeSlot) {
            if let index = selectedTimeSlots.firstIndex(where: { $0.id == timeSlot.id }) {
                selectedTimeSlots.remove(at: index)
            } else {
                selectedTimeSlots.append(timeSlot)
            }
        }
        
        let columns: [BookingTimeSlotsColumn] = BookingsHelper.generateTimeSlotsColumn(
            zones: ["A", "B", "C"],
            timeSlots: TimeHelper.getTimeSlots(
                startTime: "08:00",
                endTime: "20:00",
                interval: 15
            )
        )
        
        var body: some View {
            BookingSelectTimeSlots(
                selectedTimeSlots: selectedTimeSlots,
                columns: columns,
                onPressTimeSlot: { timeSlot in
                    toggleTimeSlot(timeSlot: timeSlot)
                },
                onPressContinue: {
                    print("Continue")
                }
            )
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
