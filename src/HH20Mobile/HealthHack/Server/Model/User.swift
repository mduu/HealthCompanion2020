//
//  User.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation





struct User: Codable {
    
    var id: String?
    var email: String?
    var mobile: String?
    var firstname: String?
    var lastname: String?
    var street: String?
    var zip: String?
    var city: String?
    var country: String?
    var birthday: String?
    var insuranceNumber: String?
    var weight: Int?
    var height: Int?
    var availableDocuments: AvailableDocuments?
    var diseases: [DiseaseType]?
    var acuteDiseases: [AcuteDeseaseType]?
    var availableData: AvailableData?
    
}

struct AvailableDocuments: Codable {
    var prescription: Bool?
    var labResults: Bool?
    var bills: Bool?
    var general: Bool?
    var ctScans: Bool?
    var vaccinationDetails: Bool?
    var diagnosis: Bool?
    var xRays: Bool?
    var medicalReports: Bool?
}

struct AvailableData: Codable {
    var hasPrescriptionDrugs: Bool?
    var hasCoach: Bool?
    var hasMedicalEvents: Bool?
    var hasHplus: Bool?
}
