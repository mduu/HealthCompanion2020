//
//  EventsBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ActivitiesBuilder {
    func build() -> ActivitiesViewController {
        let viewController: ActivitiesViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ActivitiesFlowController(viewController: viewController)
        let viewModel = ActivitiesViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

