//
//  OnbaordingDocumentsCell.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation
import UIKit

class OnboardingDocumentsCell: UITableViewCell {
    
    weak var switchDelegate: DocumentSwitchDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var documentName: UILabel!
    @IBOutlet weak var isDocumentActive: UISwitch!
    
    @IBAction func onDocumentSwitchChanged(_ sender: UISwitch) {
        switchDelegate?.switchToggled(active: isDocumentActive.isOn)
    }
}

protocol DocumentSwitchDelegate: class {
    func switchToggled(active: Bool)
}
