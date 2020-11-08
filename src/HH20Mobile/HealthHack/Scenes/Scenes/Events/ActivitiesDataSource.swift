//
//  ActivityCatalogueDataSource.swift
//  Helsana
//
//  Created by Norbert Sroczyński on 07.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit
import TimelineTableViewCell

final class ActivitiesDataSource: NSObject {
    static let activityCellIdentifier: String = "TimelineTableViewCell"
    
    var activitySections: [ActivitySection] = []
    
//    func getActivityById(activityId: String) -> Activity? {
//        let index = activities.firstIndex { $0.getId() == activityId }
//        guard let _ = index else { return nil }
//        return activities[index!]
//    }
    
    func getActivity(at indexPath: IndexPath) -> Activity {
        return activitySections[indexPath.section].activities[indexPath.row]
    }
    
    func reuseIdentifier(forIndexPath indexPath: IndexPath) -> String {
        return String(ActivitiesDataSource.activityCellIdentifier)
    }
}

extension ActivitiesDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return activitySections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DateHelper.getLocalDateStringFromDate(activitySections[section].date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitySections[section].activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesDataSource.activityCellIdentifier) as! TimelineTableViewCell
        
        let activity = activitySections[indexPath.section].activities[indexPath.row]
        cell.bubbleColor = .helsanaRot()
        cell.backgroundColor = .hintergrundApp()
        
        cell.titleLabel.numberOfLines = 0
        
        let str = activity.getTitle()
        let offset = min(str.count, 23)
        let index = str.index(str.startIndex, offsetBy: offset)
        
        cell.titleLabel.text = String(str[..<index])
        cell.titleLabel.font = .akkuratBold(ofSize: 16)
        
        
        cell.descriptionLabel.text = activity.getDescription()
        cell.descriptionLabel.font = .akkuratBold(ofSize: 13)
        
        let icon = activity.getIcon().withRenderingMode(.alwaysTemplate)
        cell.illustrationImageView.tintColor = .helsanaRot()
        cell.illustrationImageView.image = icon
        cell.illustrationImageView.contentMode = .scaleToFill
        
        
        cell.timeline.backColor = .helsanaRot()
        cell.timeline.frontColor = .helsanaRot()
        cell.timeline.width = 20
        
        cell.timelinePoint.isFilled = true
        cell.timelinePoint.color = .weiss()
        cell.timelinePoint.diameter = 12
        
        return cell
    }
}
