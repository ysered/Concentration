//
//  AppStyles.swift
//  Concentration
//
//  Created by Yurii Serediuk on 14.10.2019.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import UIKit

class AppColors {
    private(set) static var transparent = UIColor(named: "Transparent")!
    
    private(set) static var bgHalloween = UIColor(named: "BgHalloween")!
    private(set) static var accentHalloween = UIColor(named: "AccentHalloween")!
    
    private(set) static var accentColor = accentHalloween
}

class AppStyles {

    private(set) static var labelTextAttributes: [NSAttributedString.Key:Any] = [
        //.strokeWidth: 5.0,
        .strokeColor: AppColors.accentColor
    ]
    
    static func getCardBackgroundColor(isCardMatched: Bool) -> UIColor {
        return isCardMatched ? AppColors.transparent : AppColors.accentColor
    }
}

struct AppTheme {
    var backgroundColor: UIColor
    var accentColor: UIColor
    var emojiSet: String
}


//    case faces = "🙂😍😡😢🤓🤬🤯🤔😴"
//    case haloween = "🎃👻😈🦇🕷🍎🍭🦴🕸"
//    case animals = "🐶🐼🐠🐥🙉🐞🐊🐧🐷"
//    case fruits = "🍓🍉🍌🍒🍋🍇🥝🍊🥥"
//    case vegetables = "🥑🥦🥕🍆🍅🌶🥔🥬🌽"
//    case sport = "⚽️🏀🏓🥊🏉🎱🥅🥋⛷"
//    case food = "🍔🍟🍕🥗🌭🍗🍦🍳🍱"
//    case traveling = "🚕✈️🚁⛴🎢🎡🏕🏝🏰"
//    case objects = "📱💾🖥📷📺📽💡⏰📻"

enum AppThemes : CaseIterable {
    case haloween
    case animals
    
    func getTheme() -> AppTheme {
        
        switch self {
        case .haloween:
            return AppTheme(backgroundColor: AppColors.bgHalloween, accentColor: AppColors.accentHalloween, emojiSet: "🎃👻😈🦇🕷🍎🍭🦴🕸")
        case .animals:
            return AppTheme(backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), accentColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), emojiSet: "🐶🐼🐠🐥🙉🐞🐊🐧🐷")
        }
    }
}
