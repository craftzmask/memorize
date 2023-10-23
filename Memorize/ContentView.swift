//
//  ContentView.swift
//  Memorize
//
//  Created by Khanh Chung on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    let themes = [
        "vehicle": ["🚗", "🚛", "🚁", "🚃", "🛳️", "🛩️", "🚂"],
        "halloween": ["👻", "🕷️", "😈", "💀", "🦇", "🧛‍♂️", "🎃"],
        "animal": ["🐈", "🐕", "🐿️", "🐇", "🦇", "🐒", "🐁"],
    ]
    
    @State var emojis: [String] = []
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                if emojis.isEmpty {
                    Text("Choose a theme to start")
                } else {
                    cards
                }
            }
            
            HStack {
                themeSelector(themeName: "vehicle", symbol: "car")
                Spacer()
                themeSelector(themeName: "halloween", symbol: "flame")
                Spacer()
                themeSelector(themeName: "animal", symbol: "pawprint")
            }
        }
        .padding()
    }
    
    func themeSelector(themeName: String, symbol: String) -> some View {
        Button(action: {
            let theme = themes[themeName, default: []]
            emojis = (theme + theme).shuffled()
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(themeName.capitalized).font(.footnote)
            }
        })
        .font(.largeTitle)
        .imageScale(.large)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
