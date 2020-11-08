//
//  LoginViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class LoginViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: LoginFlowController!

    // MARK: Lifecycle methods
    init(flowController: LoginFlowController) {
        self.flowController = flowController
        super.init()
    }
}
