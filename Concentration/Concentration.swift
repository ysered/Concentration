//
//  Concentration.swift
//  Concentration
//
//  Created by Yurii Serediuk on 10/6/19.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let facedUpCards = cards.enumerated().filter { (index, card) -> Bool in card.isFaceUp }
            return facedUpCards.count == 1 ? facedUpCards.first!.offset : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): pairs of cards should be > 0")
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index in cards array bounds")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if 2 cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
