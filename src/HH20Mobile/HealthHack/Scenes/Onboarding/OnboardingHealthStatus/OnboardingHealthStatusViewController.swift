//
//  OnboardingHealthStatusViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingHealthStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var healthStatusTableview: UITableView!
    
    // MARK: - Attributers
    var viewModel: OnboardingHealthStatusViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        healthStatusTableview.delegate = self
        healthStatusTableview.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells(in: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isSelected = viewModel.isHealthConditionSelected(at: indexPath)
        cell.setSelected(isSelected, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthStatusCell", for: indexPath) as! HealthStatusCell
        cell.healthConditionName.text = self.viewModel.getHealthConditions(at: indexPath)
        
        let isSelected = viewModel.isHealthConditionSelected(at: indexPath)
        cell.setSelected(isSelected, animated: false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Chronic Conditions"
        case 1:
            return "Acute Conditions"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.didDeselectItem(at: indexPath)
    }
    
    @IBAction func onContinueButtonPressed(_ sender: Any) {
        viewModel.navigateToOnboardingServices()
    }

}
