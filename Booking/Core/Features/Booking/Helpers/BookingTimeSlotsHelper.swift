//
//  BookingTimeSlotsHelper.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

class BookingTimeSlotsHelper {
    static func timeSlotText(
        timeSlot: BookingTimeSlot
    ) -> String {
        return timeSlot.startTime + "-" + timeSlot.endTime + ", " + timeSlot.zone
    }
    
    static func addMinutes(to time: String, minutes: Int) -> String? {
       let formatter = DateFormatter()
       formatter.dateFormat = "HH:mm"

       guard let date = formatter.date(from: time) else { return nil }
       let newDate = Calendar.current.date(byAdding: .minute, value: minutes, to: date)!
       return formatter.string(from: newDate)
    }
    
    static func generateTimeSlotsColumns(
        zones: [String],
        startTime: String,
        endTime: String,
        interval: Int
    ) -> [BookingTimeSlotsColumn] {
        let timeSlots = TimeHelper.getTimeSlots(
            startTime: startTime,
            endTime: endTime,
            interval: interval
        )
        
        return zones.map { zone in
            BookingTimeSlotsColumn(
                zone: zone,
                timeSlots: timeSlots.compactMap { time in
                    guard let endTime = self.addMinutes(to: time, minutes: interval) else {
                        return nil
                    }

                    return BookingTimeSlot(
                        startTime: time,
                        endTime: endTime,
                        zone: zone
                    )
                }
            )
        }
    }

    static func getEarliestTimeSlot(
        selectedTimeSlots: [BookingTimeSlot],
        zone: String? = nil
    ) -> BookingTimeSlot? {
        let filtered = zone != nil
            ? selectedTimeSlots.filter { $0.zone == zone }
            : selectedTimeSlots

        return filtered.min(by: { $0.startTime < $1.startTime })
    }

    static func getLatestTimeSlot(
        selectedTimeSlots: [BookingTimeSlot],
        zone: String? = nil
    ) -> BookingTimeSlot? {
        let filtered = zone != nil
            ? selectedTimeSlots.filter { $0.zone == zone }
            : selectedTimeSlots

        return filtered.max(by: { $0.startTime < $1.startTime })
    }
    
    static func isTimeSlotSelected(
        timeSlot: BookingTimeSlot,
        selectedTimeSlots: [BookingTimeSlot]
    ) -> Bool {
        guard
            let first = getEarliestTimeSlot(selectedTimeSlots: selectedTimeSlots, zone: timeSlot.zone),
            let last = getLatestTimeSlot(selectedTimeSlots: selectedTimeSlots, zone: timeSlot.zone)
        else {
            return false
        }
        
        return timeSlot.startTime >= first.startTime &&
               timeSlot.startTime < last.endTime
    }
    
    static func isTimeSlotsConnected(_ a: BookingTimeSlot, _ b: BookingTimeSlot) -> Bool {
        guard a.zone == b.zone else { return false }
        return a.endTime == b.startTime || b.endTime == a.startTime
    }
    
    static func onPressTimeSlot(
        timeSlot: BookingTimeSlot,
        selectedTimeSlots: [BookingTimeSlot]
    ) -> [BookingTimeSlot] {
        var updatedTimeSlots = selectedTimeSlots
        
        // Check for existing selection in the same zone
        if let index = updatedTimeSlots.firstIndex(where: { $0.zone == timeSlot.zone }) {
            var existing = updatedTimeSlots[index]

            
            // Restart if start is clicked
            if timeSlot.startTime == existing.startTime  {
                updatedTimeSlots.remove(at: index)
                return updatedTimeSlots
            }
            
            
            // Update startTime or endTime based on position
            if timeSlot.startTime < existing.startTime {
                existing.startTime = timeSlot.startTime
            } else if timeSlot.endTime > existing.endTime {
                existing.endTime = timeSlot.endTime
            }
            else if (timeSlot.endTime < existing.endTime) {
                existing.endTime = timeSlot.endTime
            }

            updatedTimeSlots[index] = existing
        } else {
            // No existing selection for zone → add new
            updatedTimeSlots.append(timeSlot)
        }
        
        return updatedTimeSlots
    }
}
