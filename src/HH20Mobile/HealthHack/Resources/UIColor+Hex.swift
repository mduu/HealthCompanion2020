//
//  UIColor+Hex.swift
//  Helsana
//
//  Created by Norbert Sroczyński on 07.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt) {
        let A = CGFloat((hex >> 24) & 0xFF) / 255
        let R = CGFloat((hex >> 16) & 0xFF) / 255
        let G = CGFloat((hex >> 08) & 0xFF) / 255
        let B = CGFloat((hex >> 00) & 0xFF) / 255
        self.init(red: R, green: G, blue: B, alpha: A)
    }
    
    convenience init(hexString: String) {
        let string =  hexString.replacingOccurrences(of: "#", with: "")
        let hex = string.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let (a, r, g, b): (UInt32, UInt32, UInt32, UInt32) = {
            switch hex.count {
            case 3: // RGB (12-bit)
                return (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                return (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                return (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                return (1, 1, 1, 0)
            }
        }()
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIColor {
    func hex() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

