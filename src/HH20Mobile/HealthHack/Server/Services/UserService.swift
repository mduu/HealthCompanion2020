//
//  UserService.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


import Foundation

final class UserService: NSObject {
    
    private let restRepository: UserRestRepository
    
    init(restRepository: UserRestRepository = UserRestRepository()) {
        self.restRepository = restRepository
        super.init()
    }
    
    func updateUser(with insuranceNumber: String?, birthDate: Date?, completion: ((User?, Error?) -> Void)? = nil) {
        restRepository.getUser(with: insuranceNumber, birthDate: birthDate, completion: completion)
    }
    
    func spreadDeseases(deseases: [DiseaseType], accuteDeseases: [AcuteDeseaseType], completion: ((Error?) -> Void)? = nil) {
        restRepository.spreadDeseases(deseases: deseases, accuteDeseases: accuteDeseases, completion: completion)
    }
}
