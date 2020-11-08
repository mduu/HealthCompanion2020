//
//  ShareService.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


final class ShareService: NSObject {
    
    private let restRepository: ShareRestRepository
    
    init(restRepository: ShareRestRepository = ShareRestRepository()) {
        self.restRepository = restRepository
        super.init()
    }
    
    func shareDocuments(with share: Share, completion: ((Share?, Error?) -> Void)? = nil) {
        restRepository.shareDocuments(with: share, completion: completion)
    }
    
}
