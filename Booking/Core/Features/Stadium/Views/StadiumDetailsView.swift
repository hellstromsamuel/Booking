//
//  StadiumDetailsView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct StadiumDetailsView: View {
    let stadium: Stadium

    @StateObject var viewModel = StadiumDetailsViewModel()
    @State private var startTime: String = ""
    @State private var endTime: String = ""
    
    var helpText: String? {
        if (startTime == "") {
            return "Choose start time"
        } else if (endTime == "") {
            return "Choose end time"
        } 
        return nil
    }
    
    func isSelected(timeSlot: String) -> Bool {
        if timeSlot == startTime {
            return true
        }
        if startTime.isEmpty || endTime.isEmpty {
            return false
        }
        return timeSlot >= startTime && timeSlot <= endTime
    }
    
    func action(timeSlot: String) {
        // If clicking already selected start time, reset both
        if timeSlot == startTime {
            startTime = ""
            endTime = ""
            return
        }
        
        // If clicking already selected end time, just reset end time
        if timeSlot == endTime {
            endTime = ""
            return
        }
        
        // If no start time set, set it
        if startTime.isEmpty {
            startTime = timeSlot
            return
        }
        
        // If start time is set but no end time, set end time if valid
        if endTime.isEmpty {
            // Only set end time if after start time
            if timeSlot > startTime {
                endTime = timeSlot
            } else {
                // If before start time, make this new start time
                startTime = timeSlot
            }
            return
        }
        
        // If both times set, start new selection
        startTime = timeSlot
        endTime = ""
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.timeSlots, id: \.self) { timeSlot in
                        Button(action: {
                            action(timeSlot: timeSlot)
                        }) {
                            Text(timeSlot)
                                .padding(10)
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .tint(isSelected(timeSlot: timeSlot) ? .accentColor : .primary)
                        .padding(4)
                    }
                }
            }    
            HStack {
                if let helpText = helpText {
                    Text(helpText)
                } else {
                    Text("Selected time: \(startTime) - \(endTime)")
                }
            }.padding()
        }
        .navigationTitle(stadium.name)
        .onAppear {
            viewModel.loadTimeSlots(startTime: "10:00", endTime: "22:00", interval: 15)
        }
    }
}

struct StadiumDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumDetailsView(stadium: StadiumMock.sampleStadiums[0])
    }
}
