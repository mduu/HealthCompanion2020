//
//  DocumentPreviewViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 08.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class DocumentPreviewViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: DocumentPreviewFlowController!

    // MARK: Lifecycle methods
    init(flowController: DocumentPreviewFlowController) {
        self.flowController = flowController
        super.init()
    }
}
