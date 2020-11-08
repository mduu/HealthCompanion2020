//
//  OnboardingServicesFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingServicesFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingServicesViewController!
    
    init(viewController: OnboardingServicesViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    func navigateToOnboardingDeviceLink(selectedServices: [String]) {
        viewController.navigationController?.pushViewController(OnboardingDeviceLinkBuilder().build(selectedServices: selectedServices), animated: true)
    }
}
