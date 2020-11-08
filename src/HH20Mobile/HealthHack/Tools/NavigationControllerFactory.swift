//
//  NavigationControllerFactory.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
import UIKit

struct NavigationControllerFactory {
    
    static func create(withRootViewController controller: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.setNavigationBarHidden(false, animated: false)
        
        navigationController.view.backgroundColor = UIColor.hintergrundApp()
        navigationController.extendedLayoutIncludesOpaqueBars = true
        navigationController.navigationBar.layoutMargins.left = 24
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        let largeTextAttributes : [NSAttributedString.Key : Any]? = [NSAttributedString.Key.foregroundColor : UIColor.textPrimary(),
                                                                     NSAttributedString.Key.font : UIFont.akkuratLight(ofSize: 32)]
        navigationController.navigationBar.largeTitleTextAttributes = largeTextAttributes
        
        let smallTextAttributes : [NSAttributedString.Key : Any]? = [NSAttributedString.Key.foregroundColor : UIColor.textPrimary(),
                                                                     NSAttributedString.Key.font : UIFont.akkurat(ofSize: 16)]
        navigationController.navigationBar.titleTextAttributes = smallTextAttributes
        
        return navigationController
    }
}
