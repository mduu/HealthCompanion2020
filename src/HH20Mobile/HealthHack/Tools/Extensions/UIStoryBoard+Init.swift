//
//  UIStoryBoard+Init.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func instantiateInitialViewController<Controller: UIViewController>(name: String? = nil, bundle: Bundle? = nil) -> Controller {
        let controllerName = name ?? String(describing: Controller.self)
        let storyboard = UIStoryboard(name: controllerName, bundle: bundle)

        guard let controller = storyboard.instantiateInitialViewController() as? Controller else {
            fatalError("Couldn't instantiate \(controllerName)")
        }
        return controller
    }
}

