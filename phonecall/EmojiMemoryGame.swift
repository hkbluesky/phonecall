//
//  EmojiMemoryGame.swift
//  phonecall
//
//  Created by Tom Lou on 3/30/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        //MemoryGame<String> (numberofParisOfCards: 2) {}
    //private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😀", "👻", "🎃"]
        return MemoryGame<String>(numberofParisOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}

