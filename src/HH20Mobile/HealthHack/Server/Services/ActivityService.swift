//
//  ActivityDetailsService.swift
//  Helsana
//
//  Created by Konrad Siemczyk on 25.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import Foundation

final class ActivityService: NSObject {
    
    private let restRepository: ActivityRestRepository
    
    init(restRepository: ActivityRestRepository = ActivityRestRepository()) {
        self.restRepository = restRepository
        super.init()
    }
    
    func fetchActivities(_ completion: (([Activity]?, Error?) -> Void)? = nil) {
        restRepository.fetchActivities(completion)
    }
    
    func createActivity(date: Date, title: String, description: String, details: String, type: ActivityType, completion: ((Error?) -> Void)? = nil) {
        restRepository.createActivity(date: date, title: title, description: description, details: details, type: type, completion: completion)
    }
}
