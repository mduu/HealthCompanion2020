//
//  AcuteDiseaseType.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation

enum AcuteDeseaseType: Int, Codable {
    case brokenBoneArm = 0
    case brokenBoneLeg = 1
    case brokenBoneCollar = 2
    case burn = 3
    case commonCold = 4
    case flu = 5
    case heartAttack = 6
    case respiratoryInfectionBronchitis = 7
    case respiratoryInfectionCovid19 = 8
    case respiratoryInfectionPneumonia = 9
    case strepThroat = 10
    case tornLigamentsKnee = 11
    case tornLigamentsFoot = 12
    case tornLigamentsUpperBody = 13
    case other = 14
    
    func string() -> String {
        switch self {
        case .brokenBoneArm:
            return "Broken Bone Arm"
        case .brokenBoneLeg:
            return "Broken Bone Leg"
        case .brokenBoneCollar:
            return "Broken Bone Collar"
        case .burn:
            return "Burn"
        case .commonCold:
            return "Common Cold"
        case .flu:
            return "Flu"
        case .heartAttack:
            return "Heart attack"
        case .respiratoryInfectionBronchitis:
            return "Respiratory Infection Bronchitis"
        case .respiratoryInfectionCovid19:
            return "Respiratory Infection Covid 19"
        case .respiratoryInfectionPneumonia:
            return "Respiratory Infection Pneumonia"
        case .strepThroat:
            return "Strep Throat"
        case .tornLigamentsKnee:
            return "Torn Ligaments Knee"
        case .tornLigamentsFoot:
            return "Torn Ligaments Foot"
        case .tornLigamentsUpperBody:
            return "Torn Ligaments Upper Body"
        case .other:
            return "Other"
        }
    }
}
