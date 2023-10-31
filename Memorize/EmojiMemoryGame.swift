//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 10/25/23.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            // Return emoji randomly if the number of pairs less than
            // the number of emoji in the theme's emoji set
            if theme.numberOfPairs < theme.emoji.count {
                if let randomEmoji = theme.emoji.randomElement() {
                    return randomEmoji
                }
            }
            // Otherwise, just return every single emoji in the set
            if theme.emoji.indices.contains(pairIndex) {
                return theme.emoji[pairIndex]
            }
            
            return ""
        }
    }
    
    private var themes: [Theme<String>]
    private var currentTheme: Theme<String>
    private var colorMapping: [String: Color]
    @Published private var model: MemoryGame<String>
    
    init(themes: [Theme<String>]) {
        self.themes = themes
        self.currentTheme = themes[Int.random(in: 0..<themes.count)]
        self.model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
        self.colorMapping = [
            "orange": Color.orange,
            "red":    Color.red,
            "brown":  Color.brown,
            "green":  Color.green,
            "pink":   Color.pink,
            "yellow": Color.yellow
        ]
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        self.currentTheme = themes[Int.random(in: 0..<themes.count)]
        model = EmojiMemoryGame.createMemoryGame(theme: currentTheme)
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var currentThemeColor: Color {
        if let color = colorMapping[currentTheme.color] {
            return color
        }
        return .accentColor // default color
    }
    
    var themeName: String {
        currentTheme.name.capitalized
    }
}
