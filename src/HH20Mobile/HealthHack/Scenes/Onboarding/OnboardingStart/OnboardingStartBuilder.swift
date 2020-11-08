//
//  OnboardingStartBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingStartBuilder {
    func build() -> OnboardingStartViewController {
        let viewController: OnboardingStartViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingStartFlowController(viewController: viewController)
        let viewModel = OnboardingStartViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

