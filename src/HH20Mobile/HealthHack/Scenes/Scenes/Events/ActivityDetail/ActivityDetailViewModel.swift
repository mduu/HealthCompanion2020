//
//  ActivityDetailViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class ActivityDetailViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: ActivityDetailFlowController!
    var activityDetails: Activity!

    // MARK: Lifecycle methods
    init(flowController: ActivityDetailFlowController,
         activityDetails: Activity) {
        self.flowController = flowController
        self.activityDetails = activityDetails
        super.init()
    }
}
