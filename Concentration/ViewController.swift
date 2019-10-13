//
//  ViewController.swift
//  Concentration
//
//  Created by Yurii Serediuk on 10/5/19.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var emojiChoices = EmojiTheme.animals.rawValue
    private var emoji = [Card: String]()
    
    private var numberOfPairsOfCards: Int {
        get {
            return cardButtons.count / 2
        }
    }
    
    private(set) var flipCount = 0 {
        didSet {
            let attributes: [NSAttributedString.Key:Any] = [
                .strokeWidth: 5.0,
                .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            ]
            flipCountLabel.attributedText = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            flipCount = 0
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCount += 1
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Error: card was not in cardButtons array!")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
        
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.randomValue)
            emoji[card] = String(emojiChoices.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
    }
}

enum EmojiTheme: String {
    case faces = "🙂😍😡😢🤓🤬🤯🤔😴"
    case haloween = "🎃👻😈🦇🕷🍎🍭🦴🕸"
    case animals = "🐶🐼🐠🐥🙉🐞🐊🐧🐷"
    case fruits = "🍓🍉🍌🍒🍋🍇🥝🍊🥥"
    case vegetables = "🥑🥦🥕🍆🍅🌶🥔🥬🌽"
    case sport = "⚽️🏀🏓🥊🏉🎱🥅🥋⛷"

    var description: String {
        switch self {
            case .animals: return "Animals"
            case .haloween: return "Halloween"
            case .faces: return "Faces"
            case .fruits: return "Friuits"
            case .vegetables: return "Vegetables"
            case .sport: return "Sport"
        }
    }
}

extension Int {
    
    /// Generates random value using arc4random_uniform built in function.
    var randomValue: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
