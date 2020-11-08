//
//  CreateActivityFlowController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class CreateActivityFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: CreateActivityViewController!
    
    init(viewController: CreateActivityViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    
    
    
    func close() {
        DispatchQueue.main.async {
            self.viewController.dismiss(animated: true)
        }
    }
}
