//
//  BookingTimeSlotView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//
import SwiftUI

struct BookingTimeSlotView: View {
    var timeSlot: BookingTimeSlot
    var selected: Bool
    var disabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(timeSlot.startTime)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .background(
                   RoundedRectangle(cornerRadius: 12, style: .continuous)
                       .fill(selected ? Color.accentColor.opacity(0.2) : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(selected ? Color.accentColor : Color.gray.opacity(0.4), lineWidth: 2)
                )
        }
        .disabled(disabled)
        .cornerRadius(12)
        .buttonStyle(.borderless)
    }
}

struct BookingTimeSlotView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var isSelected: Bool = false
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
                        timeSlot: BookingTimeSlot(
                            startTime: "09:15",
                            endTime: "09:15",
                            zone: "A"
                        ),
                        selected: isSelected,
                        disabled: isDisabled,
                        action: {
                            print("Selected time: 09:15, A")
                        }
                    )
                    .padding()
                }
            }
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
