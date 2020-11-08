//
//  ActivityRestRepository.swift
//  HealthHack
//
//  Created by Anatoli Benke on 28.09.19.
//  Copyright © 2019 Anatoli Benke. All rights reserved.
//

import Foundation

final class ActivityRestRepository: RestRepository {
    
    
    func fetchActivities(_ completion: (([Activity]?, Error?) -> Void)? = nil) {
        RestManager.shared.request(urlString: "activities", httpMethod: .get, parameters: nil, type: [Activity].self) { result, error in
            completion?(result, error)
        }
    }

    func createActivity(date: Date, title: String, description: String, details: String, type: ActivityType, completion: ((Error?) -> Void)? = nil) {
        
        let body = ActivityCreateBody(activityTime: DateHelper.stringFromDateTime(date: date), title: title, description: description, details: details, activityType: type.rawValue)
        
        RestManager.shared.request(urlString: "activities", httpMethod: .post, parameters: body, type: [NoData].self) { result, error in
            completion?(error)
        }
    }
}

struct ActivityCreateBody: Codable {
    let activityTime: String
    let title: String
    let description: String
    let details: String
    let activityType: Int
}
