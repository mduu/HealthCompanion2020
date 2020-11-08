//
//  ServicesCell.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation
import UIKit

class ServicesCell: UITableViewCell {
    
    weak var switchDelegate: ServiceSwitchDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var isServiceActive: UISwitch!
    
    @IBAction func onToggleSwitched(_ sender: Any) {
        switchDelegate?.switchToggled(active: isServiceActive.isOn, name: serviceName.text ?? "")
    }
    
}

protocol ServiceSwitchDelegate: class {
    func switchToggled(active: Bool, name: String)
}
