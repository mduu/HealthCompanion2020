//
//  ShareBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ShareBuilder {
    func build() -> ShareViewController {
        let viewController: ShareViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ShareFlowController(viewController: viewController)
        let viewModel = ShareViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

