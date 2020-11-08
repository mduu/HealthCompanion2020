//
//  OnboardingServicesViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingServicesViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingServicesFlowController!
    private var selectedDiseaseTypes: [DiseaseType]!
    private var selectedAcuteDiseaseTypes: [AcuteDeseaseType]!
    
    private var selectedServices = [String]()

    // MARK: Lifecycle methods
    init(flowController: OnboardingServicesFlowController, selectedDiseaseTypes: [DiseaseType], selectedAcuteDiseaseTypes: [AcuteDeseaseType]) {
        self.flowController = flowController
        self.selectedDiseaseTypes = selectedDiseaseTypes
        self.selectedAcuteDiseaseTypes = selectedAcuteDiseaseTypes
        super.init()
    }
    
    func getRecommendedServices() -> [[(name: String, isActive: Bool)]] {
        var services = [[("Activity Recommendation", true), ("Fitness Tracker Sync", true), ("Automatic Data Sync", false), ("Food Recommendation", false)]]
        if selectedDiseaseTypes.contains(DiseaseType.diabetesType1) || selectedDiseaseTypes.contains(DiseaseType.diabetesType2) {
            services.append([("Snaqit", true), ("Glucose Level Sync", true)])
        }
        return services
    }
    
    func addSelectedService(service: String) {
        selectedServices.append(service)
    }
    
    func isServiceSelected(service: String) -> Bool {
        return selectedServices.contains(service)
    }
    
    func removeSelectedService(service: String) {
        let index = selectedServices.firstIndex { (name) -> Bool in
            name == service
        }
        if let i = index {
            selectedServices.remove(at: i)
        }
    }
    
    func navigateToOnboardingDeviceLink() {
        flowController.navigateToOnboardingDeviceLink(selectedServices: selectedServices)
    }
}
