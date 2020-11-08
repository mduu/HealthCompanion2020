//
//  Layouter.swift
//  HealthHack
//
//  Created by Anatoli Benke on 28.09.19.
//  Copyright © 2019 Anatoli Benke. All rights reserved.
//

import Foundation
import UIKit





struct Layouter {
    
    
    
    static func getCellColor(for transportationType: TransportationType?) -> UIColor {
        guard let type = transportationType else {
            return UIColor.black
        }
        
        switch type {
        case .Car:
            //Red
            return UIColor(hex: 0xffccbc)
        case .ElectricCar:
            // Green
            return UIColor(hex: 0x388e3c)
        case .PublicBus:
            //yellow
            return UIColor(hex: 0x81c784)
        case .Walking:
            //green
            return UIColor(hex: 0x388e3c)
        case .Bicycle:
            //green
            return UIColor(hex: 0x388e3c)
        case .Hybrid:
            //Orange
            return UIColor(hex: 0xfff176)
        }
    }
    
    
    static func getIcon(for transportationType: TransportationType?) -> UIImage? {
        guard let type = transportationType else {
            return nil
        }
        
        switch type {
        case .Car:
            return UIImage.init(named: "regular-car")
        case .ElectricCar:
            return UIImage.init(named: "electric-car")
        case .PublicBus:
            return UIImage.init(named: "bus")
        case .Walking:
            return UIImage.init(named: "walk")
        case .Bicycle:
            return UIImage.init(named: "bicycle")
        case .Hybrid:
            return UIImage.init(named: "hybrid-car")
        }
    }
    
    static func applyStyle(on button: UIButton) {
        
        // Orange
        button.layer.borderColor = UIColor(hex: 0xfdad5c).cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 5.0
        
        button.backgroundColor = UIColor.white
        //green
        button.titleLabel?.textColor = UIColor(hex: 0x388e3c)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        
    }
}
