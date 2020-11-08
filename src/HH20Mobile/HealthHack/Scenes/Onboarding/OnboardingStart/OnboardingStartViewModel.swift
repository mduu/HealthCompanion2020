//
//  OnboardingStartViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingStartViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingStartFlowController!

    // MARK: Lifecycle methods
    init(flowController: OnboardingStartFlowController) {
        self.flowController = flowController
        super.init()
    }
    
    func navigateToOnboardingImportData() {
        self.flowController?.navigateToOnboardingImportData()
    }
}
