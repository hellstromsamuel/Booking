//
//  BookingTimeSlotView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//
import SwiftUI

struct BookingTimeSlotView: View {
    var timeSlot: String
    var zone: String
    var selected: Bool
    var disabled: Bool
    var action: () -> Void
    
    var body: some View {
        if selected {
            PrimaryButton(
                text: timeSlot,
                action: {
                    action()
                },
                disabled: disabled
            )
        } else {
            SecondaryButton(
                text: timeSlot,
                action: {
                    action()
                },
                disabled: disabled
            )
        }
    }
}

struct BookingTimeSlotView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var isSelected: Bool = true
        @State private var isDisabled: Bool = false

        var body: some View {
            VStack(spacing: 40) {
                List {
                    HStack {
                        Text("Selected")
                        Spacer()
                        Toggle("", isOn: $isSelected)
                            .labelsHidden()
                    }
                    HStack {
                        Text("Disabled")
                        Spacer()
                        Toggle("", isOn: $isDisabled)
                            .labelsHidden()
                    }
                    
                    BookingTimeSlotView(
                        timeSlot: "09:15",
                        zone: "A",
                        selected: isSelected,
                        disabled: isDisabled,
                        action: {
                            print("Selected time: 09:15, A")
                        }
                    )
                }
            }
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
