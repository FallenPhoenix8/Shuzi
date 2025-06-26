//
//  ShuziTests.swift
//  ShuziTests
//
//  Created by Łukasz Kwiecień on 26/06/2025.
//

import XCTest
@testable import Shuzi

final class ShuziTests: XCTestCase {
    func testMyMax() throws {
        // Setup data
        let pairs: [(Int, Int)] = [(3, 10), (4, -12)]
        let triples = [(5, 20, 21)]
        let singles = [2]

        // Expected values
        let expected: [String: [Int]] = [
            "pairs": [10, 4],
            "triples": [21],
            "singles": [2]
        ]

        // Tests
        for (index, (a, b)) in pairs.enumerated() {
            
            let expectedValue = expected["pairs"]![index]
            XCTAssertEqual(myMax(a, b), expectedValue)
        }

        for (index, (a, b, c)) in triples.enumerated() {
            let expectedValue = expected["triples"]![index]
            XCTAssertEqual(myMax(a, b, c), expectedValue)
        }

        for (index, value) in singles.enumerated() {
            let expectedValue = expected["singles"]![index]
            XCTAssertEqual(myMax(value), expectedValue)
        }
    }
}
