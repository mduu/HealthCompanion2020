//
//  UIFont+Akkurat.swift
//  Helsana
//
//  Created by Norbert Sroczyński on 10.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

extension UIFont {
    private static let akkuratFontName = "Akkurat"
    private static let akkuratLightFontName = "Akkurat-Light"
    private static let akkuratBoldFontName = "Akkurat-Bold"
    
    static func akkuratLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: self.akkuratLightFontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func akkuratBold(ofSize size: CGFloat) -> UIFont {
        return self.font(withName: self.akkuratBoldFontName, ofSize: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func akkurat(ofSize size: CGFloat) -> UIFont {
        return self.font(withName: self.akkuratFontName, ofSize: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static private func font(withName name: String, ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: name, size: size)
    }
}
