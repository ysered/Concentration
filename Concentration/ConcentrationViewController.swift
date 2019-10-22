
import UIKit

class ConcentrationViewController: UIViewController {

    var appTheme: AppThemeAttributes = AppTheme.animals.getAppThemeAttributes()
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private lazy var emojiChoices: String = appTheme.emojiSet
    
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
        emojiChoices = appTheme.emojiSet
        game.reset()
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Error: card was not in cardButtons array!")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appTheme.backgroundColor
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = appTheme.getBackgroundColor(for: card)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = appTheme.getBackgroundColor(for: card)
            }
        }
        updateFlipCountLabel(with: game.flipCount)
        updateScoreLabel(with: game.score)
    }
    
    private func updateScoreLabel(with score: UInt) {
        scoreLabel.attributedText = NSAttributedString(
            string: "Score: \(score)",
            attributes: [/*.strokeWidth: 5.0, */.strokeColor: appTheme.accentColor]
        )
    }
    
    private func updateFlipCountLabel(with flips: UInt) {
        flipCountLabel.attributedText = NSAttributedString(
            string: "Flips: \(flips)",
            attributes: [/*.strokeWidth: 5.0, */.strokeColor: appTheme.accentColor]
        )
    }
        
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.randomValue)
            emoji[card] = String(emojiChoices.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
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
