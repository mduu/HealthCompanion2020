//
//  ActivityDetailBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ActivityDetailBuilder {
    func build(activtiy: Activity) -> ActivityDetailViewController {
        let viewController: ActivityDetailViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ActivityDetailFlowController(viewController: viewController)
        let viewModel = ActivityDetailViewModel(flowController: flowController, activityDetails: activtiy)
        viewController.viewModel = viewModel
        return viewController
    }
}

