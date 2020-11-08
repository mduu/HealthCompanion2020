//
//  Document.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation



struct Document: Codable {
    let id: String
    let uploadedAt: String
    let documentTime: String
    let documentType: Int
    let filename: String?
    let mimetype: String
    let title: String
    let description: String?
    
    
    
    func getDocumentTimeDate() -> Date {
        return DateHelper.removeTimeStamp(fromDate: DateHelper.dateFromDateTimeString(string: documentTime)!)
    }
}


struct DocumentSection: Codable {
    let date: Date
    let documents: [Document]
}
