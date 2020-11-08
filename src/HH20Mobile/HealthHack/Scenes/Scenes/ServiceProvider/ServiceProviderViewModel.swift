//
//  ServiceProviderViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class ServiceProviderViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: ServiceProviderFlowController!

    // MARK: Lifecycle methods
    init(flowController: ServiceProviderFlowController) {
        self.flowController = flowController
        super.init()
    }
}
