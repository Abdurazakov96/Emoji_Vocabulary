//
//  Emoji.swift
//  Emoji_Vocabulary
//
//  Created by Магомед Абдуразаков on 07/08/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import Foundation
struct Emoji: Codable {
    
    // MARK: - Public properites
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    // MARK: - Init
    
    init (symbol: String = "", name: String = "", description: String = "", usage: String = "") {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
}

// MARK: - Extension

extension Emoji {
    
    // MARK: - Public properites
    
    static var all: [Emoji] {
        return [
            Emoji(symbol: "🐶", name: "Dog", description: "Very kind animal", usage: "Лицо доброй собачки"),
            Emoji(symbol: "🐼", name: "Panda", description: "Very lazy animal", usage: "Лицо ленивой панды"),
            Emoji(symbol: "🐵", name: "Monkey", description: "Very funny animal", usage: "Лицо смешной обезьяны")
        ]
    }
    
    // MARK: - Public method
    
    static  func loadDefaults() -> [Emoji] {
        return all
    }
    
}
