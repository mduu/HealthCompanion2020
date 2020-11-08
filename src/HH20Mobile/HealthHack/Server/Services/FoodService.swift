//
//  FoodService.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation

final class FoodService: NSObject {
    private let foodRestRepository: FoodRestRepository!
    
    init(foodRestRepository: FoodRestRepository = FoodRestRepository()) {
        self.foodRestRepository = foodRestRepository
        super.init()
    }
    
    func getFoodData(base64Image: String, completion: ((FoodData?, Error?) -> Void)? = nil) {
        foodRestRepository.getFoodData(base64Image: base64Image, completion: completion)
    }
}
