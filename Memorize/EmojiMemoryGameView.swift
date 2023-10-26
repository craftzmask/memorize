//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Khanh Chung on 10/21/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel = EmojiMemoryGame()
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
                Text(card.content).font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
