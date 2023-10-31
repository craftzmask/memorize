//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Khanh Chung on 10/21/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame(themes: Theme.sampleData)
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
