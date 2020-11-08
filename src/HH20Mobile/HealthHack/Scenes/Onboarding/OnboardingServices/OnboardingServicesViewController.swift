//
//  OnboardingServicesViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingServicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ServiceSwitchDelegate {
    
    // MARK: - Attributers
    var viewModel: OnboardingServicesViewModel!
    @IBOutlet weak var servicesTableView: UITableView!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesTableView.delegate = self
        servicesTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getRecommendedServices().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getRecommendedServices()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath) as! ServicesCell
        cell.serviceName.text = self.viewModel?.getRecommendedServices()[indexPath.section][indexPath.row].name
        cell.isServiceActive.isOn = self.viewModel?.getRecommendedServices()[indexPath.section][indexPath.row].isActive ?? false
        if cell.isServiceActive.isOn {
            viewModel.addSelectedService(service: cell.serviceName.text ?? "")
        }
        cell.switchDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "General"
        default:
            return "Diabetes"
        }
    }
    
    func switchToggled(active: Bool, name: String) {
        if active {
            viewModel.addSelectedService(service: name)
        } else {
            viewModel.removeSelectedService(service: name)
        }
    }
    
    @IBAction func onContinueButtonPressed(_ sender: Any) {
        viewModel.navigateToOnboardingDeviceLink()
    }
    
    
}
