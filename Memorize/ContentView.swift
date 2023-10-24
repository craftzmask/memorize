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
    let colorThemes = [
        "vehicle": Color.red,
        "halloween": Color.orange,
        "animal": Color.green
    ]
    
    @State var currentTheme = "vehicle"
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
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        if cardCount <= 4 {
            return 120
        } else if cardCount <= 9 {
            return 100
        } else if cardCount <= 16 {
            return 80
        } else {
            return 60
        }
    }
    
    func themeSelector(themeName: String, symbol: String) -> some View {
        Button(action: {
            var theme = themes[themeName, default: []]
            let randomNumber = Int.random(in: 1..<theme.count)
            theme = Array(theme[0...randomNumber])
            emojis = (theme + theme).shuffled()
            currentTheme = themeName
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojis.count)))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(colorThemes[currentTheme])
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
