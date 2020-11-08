//
//  UserRestRepository.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


final class UserRestRepository: RestRepository {
    
    func getUser(with insuranceNumber: String?, birthDate: Date?, completion: ((User?, Error?) -> Void)? = nil) {
        
        guard let insNumber = insuranceNumber, let bDate = birthDate else {
            completion?(nil, nil)
            return
        }
        
        RestManager.shared.request(urlString: "users/import?insuranceNumber=\(insNumber)&birthday=\(DateHelper.dateOnlyString(from: bDate))", httpMethod: .get, parameters: nil, type: User.self) { result, error in
            completion?(result, error)
        }
    }
    
    func spreadDeseases(deseases: [DiseaseType], accuteDeseases: [AcuteDeseaseType], completion: ((Error?) -> Void)? = nil) {
        let requestBody = UserImportPostRequest(diseases: deseases, acuteDiseases: accuteDeseases)
        RestManager.shared.request(urlString: "users/import", httpMethod: .post, parameters: requestBody, type: NoData.self) { result, error in
            completion?(error)
        }
    }
}


struct UserImportPostRequest: Codable {
    let diseases: [DiseaseType]
    let acuteDiseases: [AcuteDeseaseType]
}
