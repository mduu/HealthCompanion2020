//
//  CreateActivityBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct CreateActivityBuilder {
    func build() -> CreateActivityViewController {
        let viewController: CreateActivityViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = CreateActivityFlowController(viewController: viewController)
        let viewModel = CreateActivityViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

