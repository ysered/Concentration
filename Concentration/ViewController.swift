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
    
    private lazy var emojiChoices = randomTheme.rawValue
    
    private var randomTheme: EmojiTheme {
        let randomIndex = EmojiTheme.allCases.count.randomValue
        return EmojiTheme.allCases[randomIndex]
    }
    private var emoji = [Card: String]()
    
    private var numberOfPairsOfCards: Int {
        get {
            return cardButtons.count / 2
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel(with: game.flipCount)
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            updateScoreLabel(with: game.score)
        }
    }

    @IBAction func touchNewGame(_ sender: UIButton) {
        emoji = [:]
        emojiChoices = randomTheme.rawValue
        game.reset()
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            updateFlipCountLabel(with: game.flipCount)
            updateScoreLabel(with: game.score)
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
                button.backgroundColor = AppStyles.getCardBackgroundColor(isCardMatched: card.isMatched)
            }
        }
        updateFlipCountLabel(with: game.flipCount)
        updateScoreLabel(with: game.score)
    }
    
    private func updateScoreLabel(with score: UInt) {
        scoreLabel.attributedText = NSAttributedString(string: "Score: \(score)",
            attributes: AppStyles.labelTextAttributes)
    }
    
    private func updateFlipCountLabel(with flips: UInt) {
        flipCountLabel.attributedText = NSAttributedString(string: "Flips: \(flips)",
            attributes: AppStyles.labelTextAttributes)
    }
        
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.randomValue)
            emoji[card] = String(emojiChoices.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
    }
}

enum EmojiTheme: String, CaseIterable {
    case faces = "🙂😍😡😢🤓🤬🤯🤔😴"
    case haloween = "🎃👻😈🦇🕷🍎🍭🦴🕸"
    case animals = "🐶🐼🐠🐥🙉🐞🐊🐧🐷"
    case fruits = "🍓🍉🍌🍒🍋🍇🥝🍊🥥"
    case vegetables = "🥑🥦🥕🍆🍅🌶🥔🥬🌽"
    case sport = "⚽️🏀🏓🥊🏉🎱🥅🥋⛷"
    case food = "🍔🍟🍕🥗🌭🍗🍦🍳🍱"
    case traveling = "🚕✈️🚁⛴🎢🎡🏕🏝🏰"
    case objects = "📱💾🖥📷📺📽💡⏰📻"

    var description: String {
        switch self {
        case .animals: return "Animals"
        case .haloween: return "Halloween"
        case .faces: return "Faces"
        case .fruits: return "Friuits"
        case .vegetables: return "Vegetables"
        case .sport: return "Sport"
        case .food: return "Food"
        case .traveling: return "Traveling"
        case .objects: return "Objects"
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
