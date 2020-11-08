//
//  OnboardingHealthStatusFlowController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class OnboardingHealthStatusFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: OnboardingHealthStatusViewController!
    
    init(viewController: OnboardingHealthStatusViewController) {
        self.viewController = viewController
        super.init()
    }
    
    // MARK: - Navigation methods
    func navigateToOnboardingServices(selectedDiseaseTypes: [DiseaseType], selectedAcuteDiseaseTypes: [AcuteDeseaseType]) {
        viewController.navigationController?.pushViewController(OnboardingServicesBuilder().build(selectedDiseaseTypes: selectedDiseaseTypes, selectedAcuteDiseaseTypes: selectedAcuteDiseaseTypes), animated: true)
    }
}
