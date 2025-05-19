//
//  BookingSelectTimeSlotsView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct BookingSelectTimeSlotsView: View {
    var zones: [String]
    var startTime: String
    var endTime: String
    var interval: Int
    var selectedTimeSlots: [BookingTimeSlot] = []
    var onPressTimeSlot: (BookingTimeSlot) -> Void
    var onRemoveTimeSlot: (BookingTimeSlot) -> Void
    var onPressContinue: () -> Void
    
    @State private var date = Date()
    
    var columns: [BookingTimeSlotsColumn] {
        return BookingTimeSlotsHelper.generateTimeSlotsColumns(
            zones: zones,
            startTime: startTime,
            endTime: endTime,
            interval: interval
        )
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                DatePicker(
                    "Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                
                HStack {
                    Text("Size")
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Select size")
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                ForEach(columns, id: \.zone) { column in
                    VStack {
                        Text(column.zone)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, 10)
            
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
                text: "Continue",
                action: onPressContinue
            )
            .padding(.vertical, 10)
        }
        .padding(.horizontal)
    }
}

struct BookingSelectTimeSlotsView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selectedTimeSlots: [BookingTimeSlot] = []
        
        func toggleTimeSlot(timeSlot: BookingTimeSlot) {
            selectedTimeSlots = BookingTimeSlotsHelper.onPressTimeSlot(
                timeSlot: timeSlot,
                selectedTimeSlots: selectedTimeSlots
            )
        }
        
        func removeTimeSlot(timeSlot: BookingTimeSlot) {
            if let index = selectedTimeSlots.firstIndex(where: { $0.id == timeSlot.id }) {
                selectedTimeSlots.remove(at: index)
            }
        }
        
        var body: some View {
            BookingSelectTimeSlotsView(
                zones: ["A", "B", "C"],
                startTime: "10:00",
                endTime: "20:00",
                interval: 15,
                selectedTimeSlots: selectedTimeSlots,
                onPressTimeSlot: { timeSlot in
                    toggleTimeSlot(timeSlot: timeSlot)
                },
                onRemoveTimeSlot: { timeSlot in
                    removeTimeSlot(timeSlot: timeSlot)
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
