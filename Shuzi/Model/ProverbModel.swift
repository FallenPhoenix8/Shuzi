//
//  ProverbModel.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 07/07/2025.
//

import Foundation

struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb, pinyin, translation
    }

    static func defaultQuote() -> ProverbModel {
        .init(
            id: "63e6ae053bd28e8c186fdf26",
            proverb: "事实胜于雄辩。",
            pinyin: "Shì shí shèng yú xióng biàn",
            translation: "Facts beat eloquence."
        )
    }
}
