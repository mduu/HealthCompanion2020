//
//  UIView+Shadow.swift
//  Helsana
//
//  Created by Anatoli Benke on 23.04.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit


extension UIView {
    
    func applyDefaultShadow() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.borderline().cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 4)
        layer.masksToBounds = false
    }
    
    func applyDefaultBorder() {
        layer.borderColor = UIColor.borderline().cgColor
        layer.borderWidth = 0.5
    }
    
    func applyDefaultRoundCorners() {
        layer.cornerRadius = 3
    }
}
