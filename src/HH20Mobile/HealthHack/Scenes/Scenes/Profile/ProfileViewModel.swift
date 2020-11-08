//
//  ProfileViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class ProfileViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: ProfileFlowController!

    // MARK: Lifecycle methods
    init(flowController: ProfileFlowController) {
        self.flowController = flowController
        super.init()
    }
}
