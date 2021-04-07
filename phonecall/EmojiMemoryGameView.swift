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
        VStack {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    self.viewModel.choose(card: card)
                }
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(.orange)
        Button(action: {
                withAnimation(.easeInOut(duration: 2)) {
                self.viewModel.resetGame()}},
                label: {
                Text("New Game")
            })

        
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
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation () {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatached {
         ZStack  {
            Group {
            if card.isConsumingBonusTime {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                    .onAppear{
                    }
            } else {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
            }
            }
            .padding(5).opacity(0.4)

            Text(self.card.content)
                .font(Font.system(size: fontSize(for: size)))
                .rotationEffect(Angle.degrees(card.isMatached ? 360 :0))
                .animation(card.isMatached ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
        //.modifier(Cardify(isFaceUp: card.isFaceUp))
        .cardify(isFaceUp: card.isFaceUp)
        .transition(AnyTransition.scale)
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


}

