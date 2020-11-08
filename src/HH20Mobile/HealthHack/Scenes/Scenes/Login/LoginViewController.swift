//
//  LoginViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

struct LoginConfig {
    static let kCurrentUserGUID: String = "CurrentUserGUIDKey"

    static let fitterHans: String = "5EA9B544-2104-11EB-ADC1-0242AC120002"
    static let peterMuster: String = "70361090-20fb-11eb-adc1-0242ac120002"
}



class LoginViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: LoginViewModel!
    
    
    @IBOutlet var onboardingSwitch: UISwitch!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .hintergrundApp()
    }
    
    @IBAction func hansFitterTapped() {
        UserDefaults.standard.setValue(LoginConfig.fitterHans, forKey: LoginConfig.kCurrentUserGUID)
        startApp()
    }
    
    @IBAction func peterMusterTapped() {
        UserDefaults.standard.setValue(LoginConfig.peterMuster, forKey: LoginConfig.kCurrentUserGUID)
        startApp()
    }
    
    func startApp() {
        
        let showOnboarding = !onboardingSwitch.isOn
        
        ViewControllerManager.shared.showInitialVC(isOnboarding: showOnboarding)
    }
    
}
