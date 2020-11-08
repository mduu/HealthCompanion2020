//
//  OnboardingDeviceLinkFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingDeviceLinkFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingDeviceLinkViewController!
    
    init(viewController: OnboardingDeviceLinkViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    func navigateToHome() {
        DispatchQueue.main.async {
            UserDefaults.standard.set(true, forKey: "onboardingDone")
            ViewControllerManager.shared.showInitialVC(isOnboarding: false)
        }
    }
}
