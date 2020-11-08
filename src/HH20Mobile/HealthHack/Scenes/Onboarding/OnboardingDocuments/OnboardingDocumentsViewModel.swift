//
//  OnboardingDocumentsViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingDocumentsViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingDocumentsFlowController!
    private var user: User!

    // MARK: Lifecycle methods
    init(flowController: OnboardingDocumentsFlowController, user: User?) {
        self.flowController = flowController
        self.user = user
        super.init()
    }
    
    func getDataDocumentsCategories() -> [[(name: String, isActive: Bool?)]] {
        return [[("Helsana Plus", user.availableData?.hasHplus), ("Coach Data", user.availableData?.hasCoach), ("Medical Events", user.availableData?.hasMedicalEvents), ("Prescription Drugs", user.availableData?.hasPrescriptionDrugs)],[("Diagnosis", user.availableDocuments?.diagnosis), ("XRays", user.availableDocuments?.xRays), ("CT Scans", user.availableDocuments?.ctScans), ("Medical Reports", user.availableDocuments?.medicalReports), ("Lab Results", user.availableDocuments?.labResults), ("Prescription", user.availableDocuments?.prescription), ("Bills",user.availableDocuments?.bills),("General",user.availableDocuments?.general), ("Vaccination Details",user.availableDocuments?.vaccinationDetails)]]
    }
    
    func navigateToOnboardingHealthStatus() {
        self.flowController?.navigateToOnboardingHealthStatus(user: user)
    }
    
    func getAvailableUserData() -> AvailableData? {
        return self.user.availableData ?? nil
    }
    
    func getAvailableUserDocuments() -> AvailableDocuments? {
        return self.user.availableDocuments ?? nil
    }
}
