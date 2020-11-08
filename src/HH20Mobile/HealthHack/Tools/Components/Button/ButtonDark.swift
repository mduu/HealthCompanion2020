//
//  ButtonDark.swift
//  Helsana
//
//  Created by Michal on 24.03.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

@IBDesignable
final class ButtonDark: SuperButton {
    
    override var isEnabled: Bool {
        didSet {
            updateStateColors()
        }
    }
    
    required init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        titleLabel?.font = UIFont.akkuratBold(ofSize: 16)
        updateStateColors()
    }
    
    private func updateStateColors() {
        if self.isEnabled {
            backgroundColor = UIColor.helsanaRot()
            setTitleColor(UIColor.weiss(), for: .normal)
        }
        else {
            backgroundColor = UIColor.hintergrundGrau3()
            setTitleColor(UIColor.schwarz(), for: .normal)
        }
    }
}
