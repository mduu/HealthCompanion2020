//
//  ShareViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class ShareViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: ShareViewModel!
    
    
    @IBOutlet var buttonShare: ButtonDark!
    
    
    
    @IBOutlet var datePickerFrom: UIDatePicker!
    @IBOutlet var datePickerTo: UIDatePicker!
    
    @IBOutlet var switchAllowActivities: UISwitch!
    @IBOutlet var switchAllowDocuments: UISwitch!
    @IBOutlet var switchAllowComments: UISwitch!
    @IBOutlet var switchAllowCommentsWrite: UISwitch!
    @IBOutlet var switchAllowDeseases: UISwitch!
    @IBOutlet var switchAllowAccuteDeseases: UISwitch!
    
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLargeTitle(enabled: true)
        applyStyle()
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
    }
    
    @IBAction func shareButtonPressed() {
        
        let share = Share(validFromTime: DateHelper.stringFromDateTime(date: datePickerFrom.date),
                          validUntilTime: DateHelper.stringFromDateTime(date: datePickerTo.date),
                          email: "",
                          allowActivities: switchAllowActivities.isOn,
                          allowDocuments: switchAllowDocuments.isOn,
                          allowComments: switchAllowComments.isOn,
                          allowCommentsWrite: switchAllowCommentsWrite.isOn,
                          allowDiseases: switchAllowDeseases.isOn,
                          allowAcuteDiseases: switchAllowAccuteDeseases.isOn)
        
        viewModel.share(share: share) { (share, error) in
            if let url = share?.shareUrl,
               let urlToShare = URL(string: url) {
                DispatchQueue.main.async {
                    self.shareURL(url: urlToShare)
                }
            }
        }
    }
    
    func shareURL(url: URL) {
        // Setting description
            let firstActivityItem = "Shared Health Data"

            // Setting url
        let secondActivityItem : NSURL = NSURL(string: url.absoluteString)!
            
            // If you want to use an image
            let image : UIImage = UIImage(named: "AppIcon_Real")!
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [ secondActivityItem, image], applicationActivities: nil)
            
            // This lines is for the popover you need to show in iPad
            activityViewController.popoverPresentationController?.sourceView = buttonShare
            
            // This line remove the arrow of the popover to show in iPad
            activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
            
            // Pre-configuring activity items
        if #available(iOS 13.0, *) {
            activityViewController.activityItemsConfiguration = [
                UIActivity.ActivityType.mail
            ] as? UIActivityItemsConfigurationReading
        } else {
            // Fallback on earlier versions
        }
            
            // Anything you want to exclude
            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo,
                UIActivity.ActivityType.postToFacebook
            ]
            
        if #available(iOS 13.0, *) {
            activityViewController.isModalInPresentation = true
        } else {
            // Fallback on earlier versions
        }
            self.present(activityViewController, animated: true, completion: nil)
    }
    
}
