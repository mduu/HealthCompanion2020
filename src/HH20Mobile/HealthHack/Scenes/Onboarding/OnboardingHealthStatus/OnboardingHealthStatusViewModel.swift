//
//  OnboardingHealthStatusViewModel.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class OnboardingHealthStatusViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: OnboardingHealthStatusFlowController!
    private var user: User!
    
    // MARK: Lifecycle methods
    init(flowController: OnboardingHealthStatusFlowController, user: User) {
        self.flowController = flowController
        self.user = user
        super.init()
        addUserDiseasesToSelectedList()
    }
    
    var selectedDeseaseTypes: [DiseaseType] = [DiseaseType]()
    var selectedAccuteDeseaseTypes: [AcuteDeseaseType] = [AcuteDeseaseType]()
    
    let deseaseTypes = [DiseaseType.alzheimerDisease,
                        DiseaseType.dementia,
                        DiseaseType.arthritis,
                        DiseaseType.asthma,
                        DiseaseType.cancer,
                        DiseaseType.copd,
                        DiseaseType.crohnDisease,
                        DiseaseType.cysticFibrosis,
                        DiseaseType.diabetesType1,
                        DiseaseType.diabetesType2,
                        DiseaseType.epilepsy,
                        DiseaseType.heartDisease,
                        DiseaseType.hiv,
                        DiseaseType.moodDisorders,
                        DiseaseType.multipleSclerosis,
                        DiseaseType.osteoporosis,
                        DiseaseType.parkinsonDisease]
    
    
    let accuteDeseaseTypes: [AcuteDeseaseType] = [AcuteDeseaseType.brokenBoneArm,
                              AcuteDeseaseType.brokenBoneLeg,
                              AcuteDeseaseType.brokenBoneCollar,
                              AcuteDeseaseType.burn,
                              AcuteDeseaseType.commonCold,
                              AcuteDeseaseType.flu,
                              AcuteDeseaseType.heartAttack,
                              AcuteDeseaseType.respiratoryInfectionBronchitis,
                              AcuteDeseaseType.respiratoryInfectionCovid19,
                              AcuteDeseaseType.respiratoryInfectionPneumonia,
                              AcuteDeseaseType.strepThroat,
                              AcuteDeseaseType.tornLigamentsKnee,
                              AcuteDeseaseType.tornLigamentsFoot,
                              AcuteDeseaseType.tornLigamentsUpperBody,
                              AcuteDeseaseType.other]
    
    func getHealthConditions(at indexPath: IndexPath) -> String? {
        if indexPath.section == 0 {
            return deseaseTypes[indexPath.row].string()
        }
        else if indexPath.section == 1 {
            return accuteDeseaseTypes[indexPath.row].string()
        }
        else {
            return nil
        }
    }
    
    func isHealthConditionSelected(at indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return selectedDeseaseTypes.contains(deseaseTypes[indexPath.row])
        }
        else if indexPath.section == 1 {
            return selectedAccuteDeseaseTypes.contains(accuteDeseaseTypes[indexPath.row])
        }
        else {
            return false
        }
    }
    
    func addUserDiseasesToSelectedList() {
        if let diseases = user.diseases {
            for disease in diseases {
                selectedDeseaseTypes.append(disease)
            }
        }
        if let acuteDiseases = user.acuteDiseases {
            for disease in acuteDiseases {
                selectedAccuteDeseaseTypes.append(disease)
            }
        }
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        if indexPath.section == 0 {
            if !selectedDeseaseTypes.contains(deseaseTypes[indexPath.row]) {
                selectedDeseaseTypes.append(deseaseTypes[indexPath.row])
            }
        }
        else if indexPath.section == 1 {
            if !selectedAccuteDeseaseTypes.contains(accuteDeseaseTypes[indexPath.row]) {
                selectedAccuteDeseaseTypes.append(accuteDeseaseTypes[indexPath.row])
            }
        }
    }
    
    func didDeselectItem(at indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedDeseaseTypes.removeAll{ $0.string() == deseaseTypes[indexPath.row].string() }
        }
        else if indexPath.section == 1 {
            selectedAccuteDeseaseTypes.removeAll{ $0.string() == accuteDeseaseTypes[indexPath.row].string() }
        }
    }
    
    func numberOfCells(in section: Int) -> Int {
        if section == 0 {
            return deseaseTypes.count
        }
        else if section == 1 {
            return accuteDeseaseTypes.count
        }
        else {
            return 0
        }
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func getUserDiseases() -> [DiseaseType] {
        return self.user.diseases ?? []
    }
    
    func getUserAcuteDiseases() -> [AcuteDeseaseType] {
        return self.user.acuteDiseases ?? []
    }
    
    func navigateToOnboardingServices() {
        do {
            try UserDefaults.standard.set(PropertyListEncoder().encode(selectedDeseaseTypes), forKey: "selectedDeseaseTypes")
            try UserDefaults.standard.set(PropertyListEncoder().encode(selectedAccuteDeseaseTypes), forKey: "selectedAccuteDeseases")
            flowController.navigateToOnboardingServices(selectedDiseaseTypes: selectedDeseaseTypes, selectedAcuteDiseaseTypes: selectedAccuteDeseaseTypes)
        } catch is Error {
            
        }
        
    }
    
}
