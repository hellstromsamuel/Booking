//
//  BookingFormView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 16/05/2025.
//

import SwiftUI

struct BookingFormView: View {
    let stadium: Stadium
    
    @StateObject var viewModel = BookingFormViewModel()
    
    @State var showTimeSlotsSheet: Bool = false;
    @State var selectedTimeSlots: [BookingTimeSlot] = []

    @State private var date = Date()
    @State private var startTime: String = ""
    @State private var endTime: String = ""
    
    var formattedTimeText: String {
        return BookingsHelper.formatTimeText(
            startTime: startTime,
            endTime: endTime
        )
    }
    
    var timeSlotsHelpText: String {
        return BookingsHelper.getTimeSlotsHelpText(
            startTime: startTime,
            endTime: endTime
        )
    }
    
    var timeButtonText: String {
        let timeText = formattedTimeText
        if formattedTimeText.isEmpty {
            return "Choose time"
        }
        return timeText
    }
  
    func action(timeSlot: BookingTimeSlot) {
        var existing: BookingTimeSlot? {
            selectedTimeSlots.first(
                where: { $0.id == timeSlot.id}
            )
        }
        
        if existing != nil {
            selectedTimeSlots = selectedTimeSlots.filter(
                { $0.id != timeSlot.id }
            )
        } else {
            selectedTimeSlots.append(timeSlot)
        }
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Location")) {
                    HStack {
                        Text("Stadium")
                        Spacer()
                        Text(stadium.name)
                    }
                
                }
                
                Section(header: Text("Activity")) {
                    HStack {
                        Image(systemName: "calendar")
                        DatePicker(
                                "Start Date",
                                selection: $date,
                                displayedComponents: [.date]
                            )
                    }
                    HStack {
                        Image(systemName: "clock")
                        Text("Time")
                        Spacer()
                        TextButton(
                            text: timeButtonText,
                            action: {
                                showTimeSlotsSheet = true
                            },
                            fullWidth: false,
                            padding: 6
                        )
                    }
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Zone")
                        Spacer()
                        TextButton(
                            text: "Choose zone",
                            action: {
                                showTimeSlotsSheet = true
                            },
                            fullWidth: false,
                            padding: 6
                        )
                    }
                }
            }
            
            VStack {
                PrimaryButton(text: "Complete booking", action: {})
            }
            .padding()
        }
        .navigationTitle("New booking")
        .sheet(isPresented: $showTimeSlotsSheet) {
            NavigationStack {
                BookingSelectTimeSlots(
                    selectedTimeSlots: selectedTimeSlots,
                    columns: viewModel.columns,
                    onPressTimeSlot: { timeSlot in
                        action(timeSlot: timeSlot)
                    },
                    onPressContinue: {
                        showTimeSlotsSheet = false
                    }
                )
                .navigationTitle(timeSlotsHelpText)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.loadTimeSlots(stadium: stadium)
        }
    }
}

struct BookingFormView_Previews: PreviewProvider {
    static var previews: some View {
        BookingFormView(stadium: StadiumMock.sampleStadiums[0])
    }
}
