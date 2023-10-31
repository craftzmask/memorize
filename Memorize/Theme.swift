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
    
    init(name: String, emoji: [CardContent], numberOfPairs: Int = Int.random(in: 2..<10), color: String) {
        self.name = name
        self.emoji = emoji
        self.numberOfPairs = numberOfPairs
        self.color = color
    }
}

extension Theme<String> {
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
            color: "brown"
        ),
        Theme(
            name: "tree",
            emoji: ["🌺", "🌲", "🎄", "🌴", "🍄", "🌵", "🌹", "🪷", "🌳", "🪴"],
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
