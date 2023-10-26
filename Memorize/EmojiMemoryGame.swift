//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 10/25/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    func shuffle() {
        model.shuffle()
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
