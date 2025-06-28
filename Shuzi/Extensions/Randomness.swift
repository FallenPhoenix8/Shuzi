//
//  Randomness.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 28/06/2025.
//

import Foundation


extension Int {
    enum RangeError: Error {
        case invalidCount
    }
    
    static func generateUniqueRandomIntegers(count: Int, min: Int = 0, max: Int = 99) throws -> [Int] {
        // In case the task is impossible
        var swappedMax = max
        var swappedMin = min
        if max < min {
            swappedMax = min
            swappedMin = max
        }
        let minCount = swappedMax - swappedMin + 1
        if count < minCount {
            throw RangeError.invalidCount
        }
        
        // Logic
        var result: Set<Int> = []
        
        // Creating random numbers and inserting them to the set
        // Doing this until result has required count
        while result.count < count {
            let randomNumber = Int.random(in: swappedMin ... swappedMax)
            result.insert(randomNumber)
        }
        
        return Array(result).sorted()
    }
}
