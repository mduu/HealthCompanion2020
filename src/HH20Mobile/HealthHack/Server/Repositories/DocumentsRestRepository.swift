//
//  DocumentsRestRepository.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation



final class DocumentsRestRepository: RestRepository {
    
    func fetchDocuments( completion: (([Document]?, Error?) -> Void)? = nil) {
        RestManager.shared.request(urlString: "documents", httpMethod: .get, parameters: nil, type: [Document].self) { result, error in
            completion?(result, error)
        }
    }
    
    
    func getDocumentFile(id: String, completion: ((String?, Error?) -> Void)? = nil) {
        RestManager.shared.request(urlString: "documents/\(id)", httpMethod: .get, parameters: nil, type: String.self) { result, error in
            completion?(result, error)
        }
    }
    
}
