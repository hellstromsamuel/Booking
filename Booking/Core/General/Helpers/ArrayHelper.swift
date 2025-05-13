//
//  ArrayHelper.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import Foundation

struct ArrayHelper {
    /// Groups an array into subarrays of a specified maximum length.
    ///
    /// Parameters:
    /// - array: The array to be grouped.
    /// - maxLength: The maximum length of each subarray.
    ///
    /// Returns:
    /// An array of subarrays, where each subarray has a maximum length of maxLength.
    ///
    /// Example:
    /// array: [1, 2, 3, 4, 5], maxLength: 2
    /// returns: [[1, 2], [3, 4], [5]]
    static func groupArray<T>(_ array: [T], maxLength: Int) -> [[T]] {
        var result: [[T]] = []
        var currentSubarray: [T] = []
        
        for element in array {
            if currentSubarray.count == maxLength {
                result.append(currentSubarray)
                currentSubarray = []
            }
            currentSubarray.append(element)
        }
        
        if !currentSubarray.isEmpty {
            result.append(currentSubarray)
        }
        
        return result
    }
} 