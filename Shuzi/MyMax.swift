//
//  Max.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 26/06/2025.
//

import Foundation

public func myMax(_ numbers: Int...) -> Int {
    guard !numbers.isEmpty else {
        fatalError("At least one number is required")
    }

    var max = numbers[0]
    for number in numbers[1...] {
        if number > max {
            max = number
        }
    }
    return max
}
