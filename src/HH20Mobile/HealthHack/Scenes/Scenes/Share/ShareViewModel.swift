//
//  ShareViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class ShareViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: ShareFlowController!
    
    private var shareService: ShareService!

    // MARK: Lifecycle methods
    init(flowController: ShareFlowController,
         shareService: ShareService = ShareService()) {
        self.flowController = flowController
        self.shareService = shareService
        super.init()
    }
    
    func share(share: Share, completion: ((Share?, Error?) -> Void)? = nil) {
        shareService.shareDocuments(with: share, completion: completion)
    }
}
