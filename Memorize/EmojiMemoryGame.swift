//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 10/25/23.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let themes = [
        Theme(
            name: "halloween",
            emoji: ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃", "🧙", "😱", "🙀"],
            numberOfPairs: 10,
            color: .orange
        ),
        Theme(
            name: "vehicle",
            emoji: ["🚂", "🚗", "🚁", "🛳️", "🛩️", "🚛", "🚃", "🏍️", "🛴", "🚲"],
            numberOfPairs: 10,
            color: .red
        ),
        Theme(
            name: "animal",
            emoji: ["🐒", "🐿️", "🐁", "🐈", "🐕", "🦇", "🐇", "🐝", "🦋", "🐖"],
            numberOfPairs: 10,
            color: .brown
        ),
        Theme(
            name: "tree",
            emoji: ["🌺", "🌲", "🎄", "🌴", "🍄", "🌵", "🌹", "🪷", "🌳", "🪴"],
            numberOfPairs: 10,
            color: .green
        ),
        Theme(
            name: "universe",
            emoji: ["🌙", "🌞", "🌎", "🪐", "🛸", "☄️", "⭐️", "🌌", "📡", "🛰️"],
            numberOfPairs: 10,
            color: .pink
        ),
        Theme(
            name: "face",
            emoji: ["😀", "🤓", "😎", "😒", "😣", "😕", "😛", "🤪", "😱", "🥳"],
            numberOfPairs: 10,
            color: .yellow
        ),
    ]
    
    private static var theme = themes[0]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        theme = themes[Int.random(in: 0..<themes.count)]
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if theme.emoji.indices.contains(pairIndex) {
                return theme.emoji[pairIndex]
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
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var currentThemeColor: Color {
        EmojiMemoryGame.theme.color
    }
}
