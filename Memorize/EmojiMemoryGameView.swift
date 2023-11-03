//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Khanh Chung on 10/21/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.themeName)
                .font(.largeTitle)
            Text("Current Score: \(viewModel.currentScore)")
                .font(.title2)
            
            ScrollView {
                cards
            }
            Button("New Game") { viewModel.newGame() }
                .font(.title)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .animation(.default, value: viewModel.cards)
                    .onTapGesture { viewModel.choose(card) }
            }
        }
        .foregroundColor(viewModel.currentThemeColor)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .padding(4)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame(themes: Theme.sampleData))
    }
}
