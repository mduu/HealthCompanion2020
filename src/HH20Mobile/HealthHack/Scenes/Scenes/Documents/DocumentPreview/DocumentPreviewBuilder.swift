//
//  DocumentPreviewBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 08.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct DocumentPreviewBuilder {
    func build(fileUrl: String, title: String) -> DocumentPreviewViewController {
        let viewController: DocumentPreviewViewController = UIStoryboard.instantiateInitialViewController()
        viewController.fileURLString = fileUrl
        viewController.titleString = title
        let flowController = DocumentPreviewFlowController(viewController: viewController)
        let viewModel = DocumentPreviewViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

