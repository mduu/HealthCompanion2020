//
//  UIViewController+LargeTitle.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func allowFontScalingOnLargeTitle() {
        if let navBarSubviews = navigationController?.navigationBar.subviews {
            for subView in navBarSubviews where NSStringFromClass(type(of: subView)).contains("LargeTitle"){
                if let largeLabel = subView.subviews.first(where: { $0 is UILabel }) as? UILabel {
                    largeLabel.minimumScaleFactor = 0.5
                    largeLabel.adjustsFontSizeToFitWidth = true
                }
            }
        }
    }
    
    func displayLargeTitle(enabled: Bool) {
        navigationItem.largeTitleDisplayMode = enabled ? .automatic : .never
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func displayCloseButton() {
        let closeButton = UIBarButtonItem(image: UIImage(named: "Action Icon Close")?.withInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0)),
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonPressed))
        
        closeButton.tintColor = UIColor.helsanaRot()
        closeButton.isAccessibilityElement = true
        self.navigationItem.leftBarButtonItems = [closeButton]
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @objc private func closeButtonPressed() {
        self.close(animated: true)
    }
    
    @objc func close(animated: Bool, _ completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
}
