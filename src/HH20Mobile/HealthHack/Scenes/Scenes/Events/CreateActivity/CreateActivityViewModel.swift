//
//  CreateActivityViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class CreateActivityViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: CreateActivityFlowController!
    private let repository: ActivityRestRepository!
    
    var details: String = ""
    
    
    let allTypes: [ActivityType] = [.accident, .doctorVisit, .hospitalVisit, .illness, .meal, .movement, .vaccination, .measurement, .medication]
    var selectedType: ActivityType?

    // MARK: Lifecycle methods
    init(flowController: CreateActivityFlowController,
         repository: ActivityRestRepository = ActivityRestRepository()) {
        self.flowController = flowController
        self.repository = repository
        super.init()
    }
    
    func createActivity(date: Date?, title: String?, description: String?, details: String?, type: ActivityType?, completion: ((Error?) -> Void)? = nil) {
        guard
            let aDate = date,
            let aTitle = title,
            let aDescription = description,
            let aType = type,
            let details = details
        else {
            return
        }
        repository.createActivity(date: aDate, title: aTitle, description: aDescription, details: details, type: aType, completion: completion)
    }
    
    func saveTapped(date: Date?, title: String?, description: String?) {
        createActivity(date: date, title: title, description: description, details: details, type: selectedType) { [weak self] (error) in
            self?.flowController.close()
        }
    }
    
    func cancelTapped() {
        flowController.close()
    }
}
