//
//  UIColor+Helsana.swift
//  Helsana
//
//  Created by Anatoli Benke on 30.03.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

// Helsana Design Colors from ColorAssets
extension UIColor {
    
    private static let fallbackColor = UIColor.red
    
    private static func assetColor(named name: String) -> UIColor {
        return UIColor(named: name) ?? fallbackColor
    }
    
    static func btn3() -> UIColor {
        return UIColor.assetColor(named: "btn3")
    }
    
    static func helsanaBlau() -> UIColor {
        return UIColor.assetColor(named: "helsanablau")
    }
    
    static func helsanaGruen() -> UIColor {
        return UIColor.assetColor(named: "helsanagruen")
    }
    
    static func helsanaRot() -> UIColor {
        return UIColor.assetColor(named: "helsanarot")
    }
    
    static func helsanaRot2() -> UIColor {
        return UIColor.assetColor(named: "helsanarot2")
    }
    
    static func helsanaViolette() -> UIColor {
        return UIColor.assetColor(named: "helsanaviolett")
    }
    
    static func borderline() -> UIColor {
        return UIColor.assetColor(named: "borderline")
    }
    
    static func hintergrundApp() -> UIColor {
        return UIColor.assetColor(named: "apphintergrund")
    }
    
    static func hintergrundBox() -> UIColor {
        return UIColor.assetColor(named: "hintergrundbox")
    }
    
    static func hintergrundGrau1() -> UIColor {
        return UIColor.assetColor(named: "hintergrundgrau1")
    }
    
    static func hintergrundGrau2() -> UIColor {
        return UIColor.assetColor(named: "hintergrundgrau2")
    }
    
    static func hintergrundGrau3() -> UIColor {
        return UIColor.assetColor(named: "hintergrundgrau3")
    }
    
    static func hintergrundGrau4() -> UIColor {
        return UIColor.assetColor(named: "hintergrundgrau4")
    }
    
    static func navActiv() -> UIColor {
        return UIColor.assetColor(named: "navactiv")
    }
    
    static func navSelected() -> UIColor {
        return UIColor.assetColor(named: "navselected")
    }
    
    static func os() -> UIColor {
        return UIColor.assetColor(named: "os")
    }
    
    static func schwarz() -> UIColor {
        return UIColor.assetColor(named: "schwarz")
    }
    
    static func signalGelb() -> UIColor {
        return UIColor.assetColor(named: "signalgelb")
    }
    
    static func signalGruen() -> UIColor {
        return UIColor.assetColor(named: "signalgruen")
    }
    
    static func signalPink() -> UIColor {
        return UIColor.assetColor(named: "signalpink")
    }
    
    static func signalRot() -> UIColor {
        return UIColor.assetColor(named: "signalrot")
    }
    
    static func textSecondary() -> UIColor {
        return UIColor.assetColor(named: "textsecondary")
    }
    
    static func textPrimary() -> UIColor {
        return UIColor.assetColor(named: "textprimary")
    }
    
    static func textRot() -> UIColor {
        return UIColor.assetColor(named: "textrot")
    }
    
    static func textViolette() -> UIColor {
        return UIColor.assetColor(named: "textviolett")
    }
    
    static func weiss() -> UIColor {
        return UIColor.assetColor(named: "weiss")
    }
}
