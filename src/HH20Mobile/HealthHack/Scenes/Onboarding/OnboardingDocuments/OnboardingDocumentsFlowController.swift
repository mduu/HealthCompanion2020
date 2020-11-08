//
//  OnboardingDocumentsFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingDocumentsFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingDocumentsViewController!
    
    init(viewController: OnboardingDocumentsViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    func navigateToOnboardingHealthStatus(user: User) {
        self.viewController?.navigationController?.pushViewController(OnboardingHealthStatusBuilder().build(user: user), animated: true)
    }
}
