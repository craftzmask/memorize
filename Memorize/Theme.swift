//
//  Theme.swift
//  Memorize
//
//  Created by Khanh Chung on 10/28/23.
//

import SwiftUI

struct Theme<CardContent> {
    let name: String
    let emoji: [CardContent]
    let numberOfPairs: Int
    let color: Color
}
