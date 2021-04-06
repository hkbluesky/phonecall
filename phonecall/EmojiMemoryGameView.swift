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
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(.orange)

        
    /*
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
           }
    }
     */
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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatached {
         ZStack  {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity(0.4)
            Text(self.card.content)
                .font(Font.system(size: fontSize(for: size)))
        }
        //.modifier(Cardify(isFaceUp: card.isFaceUp))
        .cardify(isFaceUp: card.isFaceUp)
    }
    }
    
    // MARK: - Drawing Constants
    
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}



