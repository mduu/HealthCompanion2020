//
//  Share.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation


struct Share: Codable {
    
    var validFromTime: String
    var validUntilTime: String
    var email: String
    var allowActivities: Bool
    var allowDocuments: Bool
    var allowComments: Bool
    var allowCommentsWrite: Bool
    var allowDiseases: Bool
    var allowAcuteDiseases: Bool
    var shareUrl: String?
}
