//
//  UploadBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct UploadBuilder {
    func build() -> UploadViewController {
        let viewController: UploadViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = UploadFlowController(viewController: viewController)
        let viewModel = UploadViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

