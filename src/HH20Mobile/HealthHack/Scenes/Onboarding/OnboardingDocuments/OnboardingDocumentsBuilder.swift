//
//  OnboardingDocumentsBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingDocumentsBuilder {
    func build(user: User?) -> OnboardingDocumentsViewController {
        let viewController: OnboardingDocumentsViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingDocumentsFlowController(viewController: viewController)
        let viewModel = OnboardingDocumentsViewModel(flowController: flowController, user: user)
        viewController.viewModel = viewModel
        return viewController
    }
}

