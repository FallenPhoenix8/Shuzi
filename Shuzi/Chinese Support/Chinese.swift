//
//  Chinese.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 04/07/2025.
//

import Foundation

/// A utility class for converting numbers from 0 to 99 into their Chinese numeral and pinyin representations.
class Chinese {
    /// Converts an integer from 0 to 99 into its Chinese numeral and pinyin pronunciation.
    /// If integer exceeds this range, `nil` will be returned.
    ///
    /// - Parameter num: The number to convert (must be between 0 and 99 inclusive).
    /// - Returns: A tuple containing the Chinese representation and pinyin string, or `nil` if input is out of range or conversion fails.
    static func num99ToChinese(_ num: Int) -> ChineseNumber? {
        let stringDigits = convertToEnglishDigits(num: num)
        
        guard let stringDigits else {
            return nil
        }
        
        var chinese = ""
        for digit in stringDigits {
            guard let convertedChinese = convertToChinese(digit) else {
                return nil
            }
            chinese += convertedChinese
        }
        
        var pinyin: [String] = []
        for digit in stringDigits {
            guard let convertedPinyin = convertToPinyin(digit) else {
                return nil
            }
            pinyin.append(convertedPinyin)
        }
        
        return ChineseNumber(
            chinese: chinese,
            pinyin: pinyin.joined(separator: " "),
            number: num
        )
    }
    
    /// Converts an English digit string to its corresponding pinyin representation.
    ///
    /// - Parameter string: The English string digit (e.g., "one", "ten"). Number must be in range `0...10` range and must be correct ortographically.
    /// - Returns: The corresponding pinyin string, or `nil` if the input is invalid.
    private static func convertToPinyin(_ string: String) -> String? {
        let stringDigitToPinYin: [String: String] = [
            "zero": "líng",
            "one": "yī",
            "two": "èr",
            "three": "sān",
            "four": "shí",
            "five": "wǔ",
            "six": "liù",
            "seven": "qī",
            "eight": "bā",
            "nine": "jiǔ",
            "ten": "shí",
        ]
        return stringDigitToPinYin[string]
    }
    
    /// Converts an English digit string to its corresponding Chinese numeral.
    ///
    /// - Parameter string: The English string digit (e.g., "one", "ten"). Number must be in range `0...10` range and must be correct ortographically.
    /// - Returns: The corresponding Chinese numeral as a string, or `nil` if the input is invalid.
    private static func convertToChinese(_ string: String) -> String? {
        let stringDigitToChinese: [String: String] = [
            "zero": "零",
            "one": "一",
            "two": "二",
            "three": "三",
            "four": "四",
            "five": "五",
            "six": "六",
            "seven": "七",
            "eight": "八",
            "nine": "九",
            "ten": "十",
        ]
        return stringDigitToChinese[string]
    }
    
    /// Converts a number between 0 and 99 into an array of English digit words for internal processing.
    ///
    /// - Parameter num: The number to convert. It must be in range `0...99`.
    /// - Returns: An array of string digits (e.g., ["ten", "three"] for 13), or `nil` if the number is outside the supported range.
    private static func convertToEnglishDigits(num: Int) -> [String]? {
        let numDictionary: [Int: String] = [
            0: "zero",
            1: "one",
            2: "two",
            3: "three",
            4: "four",
            5: "five",
            6: "six",
            7: "seven",
            8: "eight",
            9: "nine",
            10: "ten",
        ]
        
        let units: Int = num % 10
        let tenths: Int = num / 10
        
        switch num {
        case 0...10:
            return [numDictionary[num] ?? ""]
        case 11...19:
            return [
                "ten",
                numDictionary[units] ?? "",
            ]
        case 20...99:
            var digits: [String] = []
                
            digits.append(numDictionary[tenths] ?? "")
            digits.append("ten")
            if units > 0 {
                digits.append(numDictionary[units] ?? "")
            }
            return digits
        default:
            return nil
        }
    }
}

extension Chinese {
    struct ChineseNumber {
        /// Contains number in simplified chinese symbols.
        let chinese: String
        /// Contains number in pinyin notation.
        let pinyin: String
        /// Contains number as an integer.
        let number: Int
    }
}
