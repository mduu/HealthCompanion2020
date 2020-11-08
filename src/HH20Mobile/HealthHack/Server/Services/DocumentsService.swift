//
//  DocumentsService.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


final class DocumentsService: NSObject {
    
    private let restRepository: DocumentsRestRepository!
    
    init(restRepository: DocumentsRestRepository = DocumentsRestRepository()) {
        self.restRepository = restRepository
        super.init()
    }
    
    func fetchDocuments( completion: (([Document]?, Error?) -> Void)? = nil) {
        restRepository.fetchDocuments(completion: completion)
    }
    
    func fetchDocumentFile(id: String, completion: ((String?, Error?) -> Void)? = nil) {
        restRepository.getDocumentFile(id: id, completion: completion)
    }
}
