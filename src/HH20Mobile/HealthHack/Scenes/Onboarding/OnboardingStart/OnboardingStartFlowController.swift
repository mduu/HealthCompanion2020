//
//  OnboardingStartFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingStartFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingStartViewController!
    
    init(viewController: OnboardingStartViewController) {
        self.viewController = viewController
        super.init()
    }   
    
    // MARK: - Navigation methods
    func navigateToOnboardingImportData() {
        self.viewController?.navigationController?.pushViewController(OnboardingImportDataBuilder().build(), animated: true)
    }
}
