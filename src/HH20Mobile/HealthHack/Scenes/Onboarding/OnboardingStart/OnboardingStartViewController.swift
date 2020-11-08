//
//  OnboardingStartViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingStartViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: OnboardingStartViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func importButtonPressed(_ sender: Any) {
        self.viewModel?.navigateToOnboardingImportData()
    }
}
