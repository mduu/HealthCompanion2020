//
//  OnboardingHealthStatusBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingHealthStatusBuilder {
    func build(user: User) -> OnboardingHealthStatusViewController {
        let viewController: OnboardingHealthStatusViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingHealthStatusFlowController(viewController: viewController)
        let viewModel = OnboardingHealthStatusViewModel(flowController: flowController, user: user)
        viewController.viewModel = viewModel
        return viewController
    }
}

