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
        //.font(Font.largeTitle)

    }


}

struct CardView: View {
    //var isFaceUp: Bool=true
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack  {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
