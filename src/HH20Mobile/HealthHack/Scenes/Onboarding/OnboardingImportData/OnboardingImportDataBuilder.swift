//
//  OnboardingImportDataBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingImportDataBuilder {
    func build() -> OnboardingImportDataViewController {
        let viewController: OnboardingImportDataViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingImportDataFlowController(viewController: viewController)
        let viewModel = OnboardingImportDataViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

