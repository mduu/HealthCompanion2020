//
//  IndicatorView.swift
//  Helsana
//
//  Created by Norbert Sroczyński on 26.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit
import MBProgressHUD

private let defaultDelay = 2.0

class Indicator {
    
    static var currentIndicator: Indicator?
    static func show(onView view: UIView, animated: Bool = true) -> Indicator {
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = UIColor.white
        let hud = MBProgressHUD.showAdded(to: view, animated: animated)
        hud.animationType = .zoom
        hud.mode = .indeterminate
        hud.bezelView.style = .solidColor
        hud.accessibilityIdentifier = "activityIndicator"
        hud.bezelView.backgroundColor = .clear
        hud.activityIndicatorColor = .helsanaRot()
        let indicator = Indicator(hud: hud)
        self.currentIndicator = indicator
        return indicator
    }

    static func showAndDismissWithDelay(onView view: UIView, animated: Bool = true, delay: Double = defaultDelay, completion: (() -> Void)? = nil) {
        let indicator = Indicator.show(onView: view, animated: animated)
        indicator.hideWithDelay(animated: animated, delay: delay, completion: completion)
    }
    
    static func hide(indicator: Indicator? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let hud = indicator ?? Indicator.currentIndicator else { return }
        hud.hide(animated: animated, completion: completion)

    }
    
    static func hideWithDelay(indicator: Indicator? = nil, animated: Bool = true, delay: Double = defaultDelay, completion: (() -> Void)? = nil) {
        guard let hud = indicator ?? Indicator.currentIndicator else { return }
        hud.hideWithDelay(animated: animated, delay: delay, completion: completion)
    }
    
    private var hud: MBProgressHUD?
    
    private init(hud: MBProgressHUD) {
        self.hud = hud
    }
    
    func hide(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.hud?.hide(animated: animated)
            Indicator.currentIndicator = nil
            completion?()
        }
    }
    
    func hideWithDelay(animated: Bool = true, delay: Double = defaultDelay, completion: (() -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.hide(animated: animated, completion: completion)
        }
    }
}
