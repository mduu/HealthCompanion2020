//
//  OnboardingDeviceLinkViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingDeviceLinkViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Attributers
    var viewModel: OnboardingDeviceLinkViewModel!
    let trackerBrandPicker = UIPickerView()
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if !viewModel.isLiveTrackerSyncActive() {
            activityTrackerTitle.isHidden = true
            appleHealthTracker.isHidden = true
            linkAppleHealthButton.isHidden = true
        }
        if !viewModel.isGlucoseTrackerActive() {
            diabetesTitle.isHidden = true
            diabetesBrand.isHidden = true
            diabetesBrandPickerField.isHidden = true
            linkDiabetesTrackerButton.isHidden = true
        }
        linkedLabel.isHidden = true
        initTrackerBrandPicker()
        diabetesBrandPickerField.text = viewModel.getTrackerBrands()[0]
    }
    
    func initTrackerBrandPicker() {
        self.trackerBrandPicker.delegate = self as UIPickerViewDelegate
        self.trackerBrandPicker.dataSource = self as UIPickerViewDataSource
        self.trackerBrandPicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showTrackerBrandPicker() {
        self.view.addSubview(trackerBrandPicker)
        self.trackerBrandPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.trackerBrandPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.trackerBrandPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func hideTrackerBrandPicker() {
        self.trackerBrandPicker.removeFromSuperview()
    }
    
    @IBOutlet weak var activityTrackerTitle: UILabel!
    @IBOutlet weak var appleHealthTracker: UILabel!
    @IBOutlet weak var linkAppleHealthButton: ButtonDark!
    
    
    @IBOutlet weak var diabetesTitle: UILabel!
    @IBOutlet weak var diabetesBrand: UILabel!
    @IBOutlet weak var diabetesBrandPickerField: UITextField!
    @IBOutlet weak var linkDiabetesTrackerButton: ButtonDark!
    
    @IBAction func onTrackerBrandFieldEntered(_ sender: Any) {
        showTrackerBrandPicker()
    }
    
    @IBAction func onTrackerBrandFieldLeft(_ sender: Any) {
        hideTrackerBrandPicker()
    }
    
    @IBAction func onFinishButtonPressed(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you ready to import your data?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.viewModel.finishImport()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getTrackerBrands().count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        diabetesBrandPickerField.text = viewModel.getTrackerBrands()[row]
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getTrackerBrands()[row]
    }
    
    @IBOutlet weak var linkedLabel: UILabel!
    
    @IBAction func onDiabetesLinkPressed(_ sender: Any) {
        linkDiabetesTrackerButton.isHidden = true
        linkedLabel.isHidden = false
    }
}
