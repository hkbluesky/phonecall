//
//  ContentView.swift
//  phonecall
//
//  Created by Tom Lou on 3/6/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
    //var viewModel: EmojiMemoryGame

    
    var body: some View {
            
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
           }
    }
        .padding()
        .foregroundColor(.orange)
        .font(Font.largeTitle)

    }


}

struct CardView: View {
    //var isFaceUp: Bool=true
    var card: MemoryGame<String>.Card
    
    
    var body: some View {
        ZStack  {
            if card.isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content).font(Font.largeTitle).padding()
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.yellow)
            }
}

        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}