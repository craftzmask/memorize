//
//  Theme.swift
//  Memorize
//
//  Created by Khanh Chung on 10/28/23.
//

import Foundation

struct Theme<CardContent> {
    let name: String
    let emoji: [CardContent]
    let numberOfPairs: Int
    let color: String
    
    init(name: String, emoji: [CardContent], numberOfPairs: Int? = nil, color: String) {
        self.name = name
        self.emoji = emoji
        self.numberOfPairs = numberOfPairs ?? emoji.count
        self.color = color
    }
}

extension Theme<String> {
    static let defaultNumberOfPairs = 10
    
    static let sampleData =
    [
        Theme(
            name: "halloween",
            emoji: ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃", "🧙", "😱", "🙀"],
            color: "orange"
        ),
        Theme(
            name: "vehicle",
            emoji: ["🚂", "🚗", "🚁", "🛳️", "🛩️", "🚛", "🚃", "🏍️", "🛴", "🚲"],
            color: "red"
        ),
        Theme(
            name: "animal",
            emoji: ["🐒", "🐿️", "🐁", "🐈", "🐕", "🦇", "🐇", "🐝", "🦋", "🐖"],
            numberOfPairs: Int.random(in: 0..<defaultNumberOfPairs),
            color: "brown"
        ),
        Theme(
            name: "tree",
            emoji: ["🌺", "🌲", "🎄", "🌴", "🍄", "🌵", "🌹", "🪷", "🌳", "🪴"],
            numberOfPairs: Int.random(in: 0..<defaultNumberOfPairs),
            color: "green"
        ),
        Theme(
            name: "universe",
            emoji: ["🌙", "🌞", "🌎", "🪐", "🛸", "☄️", "⭐️", "🌌", "📡", "🛰️"],
            color: "pink"
        ),
        Theme(
            name: "face",
            emoji: ["😀", "🤓", "😎", "😒", "😣", "😕", "😛", "🤪", "😱", "🥳"],
            color: "yellow"
        ),
    ]
}
