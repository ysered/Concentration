//
//  AppStyles.swift
//  Concentration
//
//  Created by Yurii Serediuk on 14.10.2019.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import UIKit

class AppStyles {
    
    static var accentColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    static var transparentColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0)
    
    static var labelTextAttributes: [NSAttributedString.Key:Any] = [
        .strokeWidth: 5.0,
        .strokeColor: accentColor
    ]
    
    static func getCardBackgroundColor(isCardMatched: Bool) -> UIColor {
        return isCardMatched ? transparentColor : accentColor
    }
}
