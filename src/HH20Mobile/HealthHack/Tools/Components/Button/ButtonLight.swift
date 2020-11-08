//
//  LightButton.swift
//  Helsana
//
//  Created by Michal on 24.03.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

@IBDesignable
final class ButtonLight: SuperButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required init() {
        super.init()
        commonInit()
    }
    
    fileprivate func commonInit() {
        backgroundColor = .hintergrundApp()
        applyDefaultRoundCorners()
        layer.borderWidth = 1
        layer.borderColor = UIColor.helsanaRot().cgColor
        setTitleColor(.textRot(), for: .normal)
        
        titleLabel?.font = UIFont.akkuratBold(ofSize: 16)
    }
    
}
