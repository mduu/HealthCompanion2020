//
//  Checkbox.swift
//  Helsana
//
//  Created by Konrad Siemczyk on 01.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

final class Checkbox: UIImageView {
    
    var checkedImage: UIImage?
    var uncheckedImage: UIImage?
    var checkedImageDarkMode: UIImage?
    var uncheckedImageDarkMode: UIImage?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        applyStyle()
    }
    
    @objc private func imageTapped() {
        selected = !selected
    }
    
    var selected: Bool = false {
        didSet {
            applyStyle()
            selectedCallback(selected)
        }
    }
    
    var selectedCallback: (_ isSelected: Bool) -> Void = { _ in }
    
    private func applyStyle() {
        let coloredImage = selected ? UIImage(named: "icnCheckboxFilled")?.withRenderingMode(.alwaysTemplate) : UIImage(named: "icnCheckbox")?.withRenderingMode(.alwaysTemplate)
        tintColor = UIColor.textPrimary()
        if let coloredImage = coloredImage {
            image = coloredImage
        }
    }

}
