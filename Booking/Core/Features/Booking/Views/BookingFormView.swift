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
    @State var selectedTimeSlots: [BookingTimeSlot] = [
        BookingTimeSlot(startTime: "11:00", endTime: "12:15", zone: "A")
    ]
    
    let zones = ["A", "B", "C"]
    let startTime = "10:00"
    let endTime = "20:00"
    let interval = 15
  
    func action(timeSlot: BookingTimeSlot) {
        selectedTimeSlots = BookingTimeSlotsHelper.onPressTimeSlot(
            timeSlot: timeSlot,
            selectedTimeSlots: selectedTimeSlots
        )
    }

    func remove(timeSlot: BookingTimeSlot) {
        if let index = selectedTimeSlots.firstIndex(where: { $0.zone == timeSlot.zone }) {
            selectedTimeSlots.remove(at: index)
        }
    }
    
    
    
    var body: some View {
        VStack {
            List {
                if !selectedTimeSlots.isEmpty {
                    
                    ForEach(selectedTimeSlots, id: \.id) { timeSlot in
                        Section(header: Text("Choosen time slot")) {
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                Text("Stadium")
                                Spacer()
                                Text(stadium.name)
                            }
                            HStack {
                                Image(systemName: "calendar")
                                Text("Date")
                                Spacer()
                                Text("Date value")
                            }
                            HStack {
                                Image(systemName: "clock")
                                Text(BookingTimeSlotsHelper.timeSlotText(timeSlot: timeSlot))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Button(action: {
                                print("Edit")
                            }) {
                                Text("Edit")
                                    .fontWeight(.semibold)
                            }
                                .padding(.leading, 30)

                            Button(action: {
                                print("Remove")
                                remove(timeSlot: timeSlot)
                            }) {
                                Text("Remove")
                                    .fontWeight(.semibold)
                            }
                                .tint(.red)
                                .padding(.leading, 30)
                        }
                    }
                }
            }
                .animation(.default, value: selectedTimeSlots)
            
            VStack {
                SecondaryButton(
                    text: "Select time slots",
                    action: {
                        showTimeSlotsSheet = true
                    }
                )
                PrimaryButton(text: "Complete booking", action: {})
            }
                .padding(.horizontal)
        }
        .navigationTitle("New booking")
        .sheet(isPresented: $showTimeSlotsSheet) {
            NavigationStack {
                BookingSelectTimeSlotsView(
                    zones: zones,
                    startTime: startTime,
                    endTime: endTime,
                    interval: interval,
                    selectedTimeSlots: selectedTimeSlots,
                    onPressTimeSlot: { timeSlot in
                        action(timeSlot: timeSlot)
                    },
                    onRemoveTimeSlot:{ timeSlot in
                        remove(timeSlot: timeSlot)
                    },
                    onPressContinue: {
                        showTimeSlotsSheet = false
                    }
                )
                .navigationTitle("Choose time slots")
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
