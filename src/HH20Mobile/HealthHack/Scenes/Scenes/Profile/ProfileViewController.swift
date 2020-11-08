//
//  ProfileViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: ProfileViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func logoutPressed() {
        ViewControllerManager.shared.showLoginVC()
    }
    
}
