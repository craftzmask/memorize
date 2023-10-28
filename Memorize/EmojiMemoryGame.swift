//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 10/25/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃", "🧙", "😱", "🙀"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func resetCards() {
        model.resetCards()
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
