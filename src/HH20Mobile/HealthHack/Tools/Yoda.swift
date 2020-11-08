//
//  Yoda.swift
//  Helsana
//
//  Created by Anatoli Benke on 23.04.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import Foundation
import UIKit

class Yoda {
    static func isDarkMode() -> Bool {
        if #available(iOS 12.0, *) {
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                return true
            }
        }
        
        return false
    }
}
