//
//  LoginBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct LoginBuilder {
    func build() -> LoginViewController {
        let viewController: LoginViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = LoginFlowController(viewController: viewController)
        let viewModel = LoginViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

