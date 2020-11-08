//
//  OnboardingDeviceLinkBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingDeviceLinkBuilder {
    func build(selectedServices: [String]) -> OnboardingDeviceLinkViewController {
        let viewController: OnboardingDeviceLinkViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingDeviceLinkFlowController(viewController: viewController)
        let viewModel = OnboardingDeviceLinkViewModel(flowController: flowController, selectedServices: selectedServices)
        viewController.viewModel = viewModel
        return viewController
    }
}

