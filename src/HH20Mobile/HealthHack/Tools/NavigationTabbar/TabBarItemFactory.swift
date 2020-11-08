//
//  TabBarItemFactory.swift
//  Helsana
//
//  Created by Anatoli Benke on 07.05.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

final class TabBarItemFactory {
    
    static func createTabBarItem(title: String, image: UIImage?, imageSelected: UIImage?) -> UITabBarItem {
        
        let normalImage = image?.withRenderingMode(.alwaysTemplate)
        let selectedImage = imageSelected?.withRenderingMode(.alwaysTemplate)
        
        let tabBarItem = UITabBarItem(title: title,
                                      image: normalImage,
                                      selectedImage: selectedImage)
        
        tabBarItem.badgeColor = UIColor.signalPink()
        
        let font = UIFont.akkurat(ofSize: 10)
        
        let textColor = UIColor.textSecondary()
        let textColorSelected = UIColor.navSelected()
        
        let letterSpacing = NSNumber(integerLiteral: 0)
        
        let attributesNormal = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.kern: letterSpacing
        ]
        let attributesSelected = [
            NSAttributedString.Key.foregroundColor: textColorSelected,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.kern: letterSpacing
        ]
        
        tabBarItem.setTitleTextAttributes(attributesNormal, for: .normal)
        tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        
        return tabBarItem
    }
}
