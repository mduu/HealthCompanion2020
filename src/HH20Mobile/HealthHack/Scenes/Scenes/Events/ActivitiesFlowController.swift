//
//  ActivitiesFlowController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class ActivitiesFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: ActivitiesViewController!
    
    init(viewController: ActivitiesViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    
    
    func openCreateActivity() {
        let vc = CreateActivityBuilder().build()
        
        let navVC = NavigationControllerFactory.create(withRootViewController: vc)
        
        viewController.present(navVC, animated: true, completion: nil)
    }
    
    func openActivityDetails(selectedActivity: Activity) {
       // guard let
        
        let vc = ActivityDetailBuilder().build(activtiy: selectedActivity)
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
