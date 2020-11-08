//
//  Activity.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import Foundation
import UIKit

enum ActivityType: Int, Codable {
    case hospitalVisit  = 0
    case doctorVisit    = 1
    case accident       = 2
    case illness        = 3
    case meal           = 4
    case movement       = 5
    case vaccination    = 6
    case measurement    = 7
    case medication     = 8
    
    func string() -> String {
        switch self {
        case .hospitalVisit:
            return "Hospital Visit"
        case .doctorVisit:
            return "Doctor Visit"
        case .accident:
            return "Accident"
        case .illness:
            return "Illness"
        case .meal:
            return "Meal"
        case .movement:
            return "Movement"
        case .vaccination:
            return "Vaccination"
        case .measurement:
            return "Measurement"
        case .medication:
            return "Medication"
        }
        
    }
    
    func iconImage() -> UIImage? {
        switch self {
        case .hospitalVisit:
            return UIImage(named: "krankenhaus")?.withRenderingMode(.alwaysTemplate)
        case .doctorVisit:
            return UIImage(named: "HEL-Pi_Hausarzt")?.withRenderingMode(.alwaysTemplate)
        case .accident:
            return UIImage(named: "gebrochener-knochen")?.withRenderingMode(.alwaysTemplate)
        case .illness:
            return UIImage(named: "HEL-Pi_Fiebermesser")?.withRenderingMode(.alwaysTemplate)
        case .meal:
            return UIImage(named: "essen")?.withRenderingMode(.alwaysTemplate)
        case .movement:
            return UIImage(named: "HEL-Pi_Hantel")?.withRenderingMode(.alwaysTemplate)
        case .vaccination:
            return UIImage(named: "vaccination")?.withRenderingMode(.alwaysTemplate)
        case .measurement:
            return UIImage(named: "measurement")?.withRenderingMode(.alwaysTemplate)
        case .medication:
            return UIImage(named: "HEL-Pi_Pille")?.withRenderingMode(.alwaysTemplate)
        }
    }
}

struct Activity: Codable {
    
    fileprivate let id: String?
    fileprivate let activityTime: String?
    fileprivate let title: String?
    fileprivate let description: String?
    fileprivate let userId: String?
    fileprivate let activityType: ActivityType
    fileprivate let details: String?
    fileprivate let documents: [Document]?
    fileprivate let comments: [String]?
    
    func getId() -> String? {
        return id
    }
    
    func getTitle() -> String {
        return title ?? ""
    }
    
    func getDate() -> Date {
        return DateHelper.removeTimeStamp(fromDate: DateHelper.dateFromDateTimeString(string: activityTime!)!)
    }
    
    func getDescription() -> String {
        return description ?? ""
    }
    
    func getIcon() -> UIImage {
        return activityType.iconImage()!
    }
    
    func getActivityType() -> ActivityType {
        return activityType
    }
    
    func getDetails() -> String {
        return details ?? ""
    }
    
    func getDocuments() -> [Document] {
        return documents ?? [Document]()
    }
}


struct ActivitySection: Codable {
    
    let date: Date
    let activities: [Activity]
}
