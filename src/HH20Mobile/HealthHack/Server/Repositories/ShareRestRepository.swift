//
//  ShareRestRepository.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


final class ShareRestRepository: RestRepository {
    
    func shareDocuments(with share: Share, completion: ((Share?, Error?) -> Void)? = nil) {
        
        RestManager.shared.request(urlString: "share", httpMethod: .post, parameters: share, type: Share.self) { result, error in
            completion?(result, error)
        }
    }
    
}
