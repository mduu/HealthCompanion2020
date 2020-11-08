//
//  ServiceProviderViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class ServiceProviderViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: ServiceProviderViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLargeTitle(enabled: true)
        applyStyle()
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
    }
    
}
