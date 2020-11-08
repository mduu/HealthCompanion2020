//
//  DeseaseType.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


enum DiseaseType: Int, Codable {
    case alzheimerDisease = 0
    case dementia = 1
    case arthritis = 2
    case asthma = 3
    case cancer = 4
    case copd = 5
    case crohnDisease = 6
    case cysticFibrosis = 7
    case diabetesType1 = 8
    case diabetesType2 = 9
    case epilepsy = 10
    case heartDisease = 11
    case hiv = 12
    case moodDisorders = 13
    case multipleSclerosis = 14
    case osteoporosis = 15
    case parkinsonDisease = 16
    
    func string() -> String {
        switch self {
        case .alzheimerDisease:
            return "Alzheimer Disease"
        case .dementia:
            return "Dementia"
        case .arthritis:
            return "Arthritis"
        case .asthma:
            return "Asthma"
        case .cancer:
            return "Cancer"
        case .copd:
            return "Copd"
        case .crohnDisease:
            return "Crohn Disease"
        case .cysticFibrosis:
            return "Cystic Fibrosis"
        case .diabetesType1:
            return "Diabetes Type 1"
        case .diabetesType2:
            return "Diabetes Type 2"
        case .epilepsy:
            return "Epilepsy"
        case .heartDisease:
            return "Heart Disease"
        case .hiv:
            return "HIV/AIDS"
        case .moodDisorders:
            return "Mood Disorders"
        case .multipleSclerosis:
            return "Multiple Sclerosis"
        case .osteoporosis:
            return "Osteoporosis"
        case .parkinsonDisease:
            return "Parkinson Disease"
        }
    }
}
