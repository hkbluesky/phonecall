//
//  MemoryGame.swift
//  phonecall
//
//  Created by Tom Lou on 3/30/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter {cards[$0].isFaceUp}.only}
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
    }    
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        //card.isFaceUp = !card.isFaceUp
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatached {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                     cards[chosenIndex].isMatached = true
                     cards[potentialMatchIndex].isMatached = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    
    init(numberofParisOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberofParisOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatached: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var content: CardContent
        var id: Int
    


var bonusTimeLimit: TimeInterval = 6

private var faceUpTime: TimeInterval {
    if let lastFaceUpDate = self.lastFaceUpDate {
        return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
    } else {
        return pastFaceUpTime
    }
}

var lastFaceUpDate: Date?

var pastFaceUpTime: TimeInterval = 0

var bonusTimeRemaining: TimeInterval {
    max(0, bonusTimeLimit - faceUpTime)
}

var bonusRemaining: Double {
    (bonusTimeLimit > 0 && bonusTimeLimit > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
}

var hasEarnedBonus: Bool {
    isMatached && bonusTimeRemaining > 0
}

var isConsumingBonusTime: Bool {
    isFaceUp && !isMatached && bonusTimeRemaining > 0
}
        
private mutating func startUsingBonusTime() {
    if isConsumingBonusTime, lastFaceUpDate == nil {
        lastFaceUpDate = Date()
    }
}

private mutating func stopUsingBonusTime () {
    pastFaceUpTime = faceUpTime
    self.lastFaceUpDate = nil
}

}
}

