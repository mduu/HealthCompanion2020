//
//  ProfileBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ProfileBuilder {
    func build() -> ProfileViewController {
        let viewController: ProfileViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ProfileFlowController(viewController: viewController)
        let viewModel = ProfileViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

