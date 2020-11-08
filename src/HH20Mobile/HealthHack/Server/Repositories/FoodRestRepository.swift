//
//  FoodRestRepository.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation
import UIKit

final class FoodRestRepository: RestRepository {
    
    func getFoodData(base64Image: String, completion: ((FoodData?, Error?) -> Void)? = nil) {
        let requestBody = FoodRequest(base64: "data:image/jpeg," + base64Image)
        RestManager.shared.requestFoodApi(httpMethod: .post, parameters: requestBody, type: FoodData.self) { (result, error) in
            completion?(result, error)
        }
    }
    
}

struct FoodRequest: Codable {
    let base64: String
}
