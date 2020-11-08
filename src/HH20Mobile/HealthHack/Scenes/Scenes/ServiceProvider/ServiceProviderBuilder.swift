//
//  ServiceProviderBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ServiceProviderBuilder {
    func build() -> ServiceProviderViewController {
        let viewController: ServiceProviderViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ServiceProviderFlowController(viewController: viewController)
        let viewModel = ServiceProviderViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

