//
//  OnboardingDocumentsViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingDocumentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DocumentSwitchDelegate {
    
    // MARK: - Attributers
    var viewModel: OnboardingDocumentsViewModel!
    @IBOutlet weak var documentsTableView: UITableView!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.getDataDocumentsCategories().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getDataDocumentsCategories()[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "onboardingDocumentsCell", for: indexPath) as! OnboardingDocumentsCell
        cell.documentName.text = self.viewModel?.getDataDocumentsCategories()[indexPath.section][indexPath.row].name
        cell.isDocumentActive.isOn = self.viewModel?.getDataDocumentsCategories()[indexPath.section][indexPath.row].isActive ?? false
        cell.switchDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Data"
        case 1:
            return "Documents"
        default:
            return ""
        }
    }
    
    func switchToggled(active: Bool) {
        print(active)
    }
    
    @IBAction func onContinueButtonPressed(_ sender: Any) {
        self.viewModel?.navigateToOnboardingHealthStatus()
    }
    
}
