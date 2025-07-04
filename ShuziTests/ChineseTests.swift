//
//  ChineseTest.swift
//  ShuziTests
//
//  Created by Łukasz Kwiecień on 04/07/2025.
//

import XCTest
@testable import Shuzi

final class ChineseTests: XCTestCase {
    func testChinese() throws {
        // Setup data
        let nums = [0, 3, 10, 13, 17, 20, 28, 39, 51, 99]
        let nilNums = [100, -10, 101, 102, -1, -2] // Expected values are `nil`
        // Expected values
        let expectedValues: [Chinese.ChineseNumber?] = [
            .init(chinese: "零", pinyin: "líng", number: 0),
            .init(chinese: "三", pinyin: "sān", number: 3),
            .init(chinese: "十", pinyin: "shí", number: 10),
            .init(chinese: "十三", pinyin: "shí sān", number: 13),
            .init(chinese: "十七", pinyin: "shí qī", number: 17),
            .init(chinese: "二十", pinyin: "èr shí", number: 20),
            .init(chinese: "二十八", pinyin: "èr shí bā", number: 28),
            .init(chinese: "三十九", pinyin: "sān shí jiǔ", number: 39),
            .init(chinese: "五十一", pinyin: "wǔ shí yī", number: 51),
            .init(chinese: "九十九", pinyin: "jiǔ shí jiǔ", number: 99),
        ]
        
        // Run test
        for i in 0..<nums.count {
            let value = Chinese.num99ToChinese(nums[i])
            let expected = expectedValues[i]
            
            XCTAssertNotNil(value)
            
            if let value, let expected {
                XCTAssertEqual(value.chinese, expected.chinese)
                XCTAssertEqual(value.pinyin, expected.pinyin)
            }
        }
        
        // Nil cases
        for num in nilNums {
            XCTAssertNil(Chinese.num99ToChinese(num))
        }
    }
}
