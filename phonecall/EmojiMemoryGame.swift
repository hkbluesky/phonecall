//
//  EmojiMemoryGame.swift
//  phonecall
//
//  Created by Tom Lou on 3/30/21.
//

import SwiftUI



class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        //MemoryGame<String> (numberofParisOfCards: 2) {}
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😀", "👻"]
        return MemoryGame<String>(numberofParisOfCards: 2) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        model.choose(card: card)
        
    }
}

