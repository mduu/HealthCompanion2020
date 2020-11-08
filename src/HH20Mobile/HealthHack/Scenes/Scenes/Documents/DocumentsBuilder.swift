//
//  DocumentsBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct DocumentsBuilder {
    func build() -> DocumentsViewController {
        let viewController: DocumentsViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = DocumentsFlowController(viewController: viewController)
        let viewModel = DocumentsViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

