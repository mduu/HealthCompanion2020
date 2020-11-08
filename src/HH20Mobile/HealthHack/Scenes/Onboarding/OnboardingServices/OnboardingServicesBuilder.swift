//
//  OnboardingServicesBuilder.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

struct OnboardingServicesBuilder {
    func build(selectedDiseaseTypes: [DiseaseType], selectedAcuteDiseaseTypes: [AcuteDeseaseType]) -> OnboardingServicesViewController {
        let viewController: OnboardingServicesViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = OnboardingServicesFlowController(viewController: viewController)
        let viewModel = OnboardingServicesViewModel(flowController: flowController, selectedDiseaseTypes: selectedDiseaseTypes, selectedAcuteDiseaseTypes: selectedAcuteDiseaseTypes)
        viewController.viewModel = viewModel
        return viewController
    }
}

