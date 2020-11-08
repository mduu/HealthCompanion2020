//
//  OnboardingDeviceLinkViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingDeviceLinkViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingDeviceLinkFlowController!
    private var selectedServices: [String]!
    private var userRestRepository = UserRestRepository()

    // MARK: Lifecycle methods
    init(flowController: OnboardingDeviceLinkFlowController, selectedServices: [String]) {
        self.flowController = flowController
        super.init()
        self.selectedServices = selectedServices
    }
    
    func isLiveTrackerSyncActive() -> Bool {
        return selectedServices.contains("Fitness Tracker Sync")
    }
    
    func isGlucoseTrackerActive() -> Bool {
        return selectedServices.contains("Glucose Level Sync")
    }
    
    func finishImport() {
        do {
            let storedDiseases = UserDefaults.standard.object(forKey: "selectedDeseaseTypes") as! Data
            let storedDiseaseTypes = try PropertyListDecoder().decode([DiseaseType].self, from: storedDiseases)
            let storedAcuteDiseases = UserDefaults.standard.object(forKey: "selectedAccuteDeseases") as! Data
            let storedAcuteDiseasesTypes = try PropertyListDecoder().decode([AcuteDeseaseType].self, from: storedAcuteDiseases)
            
            userRestRepository.spreadDeseases(deseases: storedDiseaseTypes, accuteDeseases: storedAcuteDiseasesTypes) { (error) in
                self.flowController.navigateToHome()
            }
        } catch is Error {
            
        }
    }
    
    func getTrackerBrands() -> [String] {
        return ["FreeStyle LibreLink", "Philips", "Roche"]
    }
}
