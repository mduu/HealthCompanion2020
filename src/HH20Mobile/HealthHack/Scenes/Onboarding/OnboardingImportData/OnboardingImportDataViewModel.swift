//
//  OnboardingImportDataViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingImportDataViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingImportDataFlowController!
    private var userRepository = UserRestRepository()
    
    weak var onboardingImportDataInterfaceDelegate: OnboardingImportDataInterfaceDelegate?

    // MARK: Lifecycle methods
    init(flowController: OnboardingImportDataFlowController) {
        self.flowController = flowController
        super.init()
    }
    
    func getInsuranceProviders() -> [String] {
        return ["Helsana", "Css", "Swica", "Concordia"]
    }
    
    func navigateToOnbaordingDocuments(user: User?) {
        self.flowController?.navigateToOnbaordingDocuments(user: user)
    }
    
    func fetchUser(with insuranceNumber: String?, birthDate: Date?) {
        self.userRepository.getUser(with: insuranceNumber, birthDate: birthDate) { (user, error) in
            self.onboardingImportDataInterfaceDelegate?.updateUserDate(user: user)
        }
    }
}

protocol OnboardingImportDataInterfaceDelegate: class {
    func updateUserDate(user: User?)
}
