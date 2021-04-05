//
//  MemoryGame.swift
//  phonecall
//
//  Created by Tom Lou on 3/30/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        //card.isFaceUp = !card.isFaceUp
        let chosenIndex: Int = cards.firstIndex(matching: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    
    init(numberofParisOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberofParisOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatached: Bool = false
        var content: CardContent
        var id: Int
    }
}
