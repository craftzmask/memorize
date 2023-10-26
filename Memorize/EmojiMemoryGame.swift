//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 10/25/23.
//

import Foundation

class EmojiMemoryGame {
    private static let emojis = ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃"]
    
    private var model = MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "⁉️"
        }
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
