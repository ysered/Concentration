//
//  AppStyles.swift
//  Concentration
//
//  Created by Yurii Serediuk on 14.10.2019.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import UIKit

struct AppColors {
    static let transparent = UIColor(named: "Transparent")!

    static let bgDefault = UIColor(named: "BgDefault")!
    static let accentDefault = UIColor(named: "AccentDefault")!
    static let labelColor = UIColor(named: "LabelColor")!
    
    static let bgHalloween = UIColor(named: "BgHalloween")!
    static let accentHalloween = UIColor(named: "AccentHalloween")!
    static let labelColorHaloween = accentHalloween
    
    static let accentColor = accentHalloween
}

class AppStyles {
    
    static func getCardBackgroundColor(isCardMatched: Bool) -> UIColor {
        return isCardMatched ? AppColors.transparent : AppColors.accentColor
    }
}
