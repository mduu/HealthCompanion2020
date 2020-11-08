//
//  OnboardingImportDataFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingImportDataFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingImportDataViewController!
    
    init(viewController: OnboardingImportDataViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    func navigateToOnbaordingDocuments(user: User?) {
        self.viewController?.navigationController?.pushViewController(OnboardingDocumentsBuilder().build(user: user), animated: true)
    }
}
