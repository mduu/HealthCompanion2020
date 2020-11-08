//
//  DocumentsDataSource.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//


import UIKit
import TimelineTableViewCell

final class DocumentsDataSource: NSObject {
    static let documentCellIdentifier: String = "TimelineTableViewCell"
    
    var documentSections: [DocumentSection] = []
    
//    func getActivityById(activityId: String) -> Activity? {
//        let index = activities.firstIndex { $0.getId() == activityId }
//        guard let _ = index else { return nil }
//        return activities[index!]
//    }
    
    func getDocument(at indexPath: IndexPath) -> Document {
        return documentSections[indexPath.section].documents[indexPath.row]
    }
    
    func reuseIdentifier(forIndexPath indexPath: IndexPath) -> String {
        return String(DocumentsDataSource.documentCellIdentifier)
    }
}

extension DocumentsDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return documentSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DateHelper.getLocalDateStringFromDate(documentSections[section].date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentSections[section].documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DocumentsDataSource.documentCellIdentifier) as! TimelineTableViewCell
        
        let document = documentSections[indexPath.section].documents[indexPath.row]
        cell.bubbleColor = .helsanaRot()
        cell.backgroundColor = .hintergrundApp()
        
        cell.titleLabel.text = document.title
        cell.titleLabel.font = .akkuratBold(ofSize: 16)

        cell.descriptionLabel.text = document.description ?? ""
        cell.descriptionLabel.font = .akkuratBold(ofSize: 13)

        let icon = UIImage(named: "HEL-Pi_download")!.withRenderingMode(.alwaysTemplate)
        cell.illustrationImageView.tintColor = .helsanaRot()
        cell.illustrationImageView.image = icon
        cell.illustrationImageView.contentMode = .scaleToFill
        
        cell.timeline.backColor = .helsanaViolette()
        cell.timeline.frontColor = .helsanaViolette()
        cell.timeline.width = 5
        
        cell.timelinePoint.isFilled = true
        cell.timelinePoint.color = .signalGruen()
        cell.timelinePoint.diameter = 20
        
        return cell
    }
}
