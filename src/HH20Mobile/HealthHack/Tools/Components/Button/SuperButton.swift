//
//  SuperButton.swift
//  Helsana
//
//  Created by Michal on 23.03.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

@IBDesignable
class SuperButton: UIButton {
    @IBInspectable var enabledAlpha: CGFloat = 1
    @IBInspectable var disabledAlpha: CGFloat = 1
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(indicator)
        self.activateConstraints(forIndicator: indicator)
        return indicator
    }()
    
    required init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        titleLabel!.font = UIFont.akkuratBold(ofSize: 16)
        applyDefaultRoundCorners()
        self.contentVerticalAlignment = .fill
    }
    
    override var isEnabled: Bool {
        didSet {
            let alpha = isEnabled ? enabledAlpha : disabledAlpha
            backgroundColor = backgroundColor?.withAlphaComponent(alpha)
            titleLabel?.alpha = alpha
        }
    }
    
    func showActivityIndicator() {
        isEnabled = false
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        isEnabled = true
        activityIndicator.stopAnimating()
    }
    
    private func activateConstraints(forIndicator indicator: UIActivityIndicatorView) {
        let constraints = [
            NSLayoutConstraint(item: indicator, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: indicator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: indicator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44),
            NSLayoutConstraint(item: indicator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
