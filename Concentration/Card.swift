//
//  Card.swift
//  Concentration
//
//  Created by Yurii Serediuk on 10/6/19.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import Foundation

struct Card: Hashable {

    private static var identifierFactory = 0
    
    private var identifier: Int
    
    var hashValue: Int {
        return identifier
    }
    
    var isFaceUp = false
    var isMatched = false

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
