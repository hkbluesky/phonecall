//
//  MemoryGame.swift
//  phonecall
//
//  Created by Tom Lou on 3/30/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    func choose (card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberofParisOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberofParisOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceup: false, isMatached: false, content: content))
            cards.append(Card(isFaceup: false, isMatached: false, content: content))
        }
        
    }
    
    
    struct Card {
        var isFaceup: Bool
        var isMatached: Bool
        var content: CardContent
    }
}
