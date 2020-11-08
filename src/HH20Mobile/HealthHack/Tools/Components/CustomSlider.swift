//
//  CustomSlider.swift
//  Helsana
//
//  Created by Benjamin Mies on 01.11.18.
//  Copyright © 2018 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    var trackHeight: CGFloat = 4
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds: CGRect = self.bounds
        bounds = bounds.insetBy(dx: -20, dy: -20)
        return bounds.contains(point)
    }
}
