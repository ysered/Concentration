
import Foundation
import UIKit

protocol AppThemeAttributes {
    var backgroundColor: UIColor { get }
    var accentColor: UIColor { get }
    var emojiSet: String { get }
    var displayName: String { get }
    
    var facedUpCardBackgroundColor: UIColor { get }
    var facedDownCardBackgroundColor: UIColor { get }
 }

extension AppThemeAttributes {
    var clearColor: UIColor {
        UIColor.clear
    }
    
    func getBackgroundColor(for card: Card) -> UIColor {
        if card.isMatched {
            return clearColor
        } else {
            return card.isFaceUp ? facedUpCardBackgroundColor : facedDownCardBackgroundColor
        }
    }
}

enum AppTheme: Int {
    case animals = 1, halloween

    func getAppThemeAttributes() -> AppThemeAttributes {
        switch self {
        case .animals: return DefaultAppThemeAttributes()
        case .halloween: return HalloweenAppThemeAttributes()
        }
    }
}

struct DefaultAppThemeAttributes: AppThemeAttributes {
    var displayName: String {
        "Default"
    }
    var backgroundColor: UIColor {
        UIColor.white
    }
    var accentColor: UIColor {
        UIColor.systemBlue
    }
    var emojiSet: String {
        "🐶🐼🐠🐥🙉🐞🐊🐧🐷"
    }
    var facedUpCardBackgroundColor: UIColor {
        return UIColor.lightGray
    }
    var facedDownCardBackgroundColor: UIColor {
        return accentColor
    }
}

struct HalloweenAppThemeAttributes: AppThemeAttributes {
    var displayName: String {
        "Halloween"
    }
    var backgroundColor: UIColor {
        UIColor.black
    }
    var accentColor: UIColor {
        UIColor.systemOrange
    }
    var emojiSet: String {
        "🎃👻😈🦇🕷🍎🍭🦴🕸"
    }
    var facedUpCardBackgroundColor: UIColor {
        UIColor.white
    }
    var facedDownCardBackgroundColor: UIColor {
        accentColor
    }
}

// faces "🙂😍😡😢🤓🤬🤯🤔😴"
// haloween "🎃👻😈🦇🕷🍎🍭🦴🕸"
// animals "🐶🐼🐠🐥🙉🐞🐊🐧🐷"
// fruits "🍓🍉🍌🍒🍋🍇🥝🍊🥥"
// vegetables "🥑🥦🥕🍆🍅🌶🥔🥬🌽"
// sport "⚽️🏀🏓🥊🏉🎱🥅🥋⛷"
// food "🍔🍟🍕🥗🌭🍗🍦🍳🍱"
// traveling "🚕✈️🚁⛴🎢🎡🏕🏝🏰"
// objects "📱💾🖥📷📺📽💡⏰📻"
