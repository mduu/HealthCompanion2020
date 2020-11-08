//
//  HomeBuilder.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

protocol HomeUserInterface: class {
    
}

struct HomeBuilder {
    func build() -> HomeViewController {
        let vc: HomeViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = HomeFlowController(viewController: vc)
        let viewModel = HomeViewModel(viewController: vc, flowController: flowController)
        vc.viewModel = viewModel
        return vc
    }
}

