//
//  NavigationTabbarViewController.swift
//  Helsana
//
//  Created by Anatoli Benke on 07.05.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//
import UIKit
//import Bond
//import ReactiveKit

final class NavigationTabbarViewController: UITabBarController {
    
    @IBOutlet private weak var tabBarBottomConstraint: NSLayoutConstraint!
    
    private var flowController = NavigationTabbarFlowController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        applyStyle()
    }
    
    private func initialSetup() {
        viewControllers = flowController.createViewControllers()
    }
    
    private func applyStyle() {
        view.backgroundColor = UIColor.hintergrundApp()
        tabBar.barTintColor = UIColor.hintergrundBox()
        tabBar.tintColor = UIColor.navSelected()
        tabBar.barStyle = .default
        tabBar.isTranslucent = false
        
        displayLargeTitle(enabled: true)
    }
    
    private func dismissAnyModalVC(animated: Bool, completion: (() -> Void)? = nil) {
        if let modalVC = (self.presentedViewController as? UINavigationController)?.viewControllers.last {
            if let deeperModalVC = modalVC.presentedViewController {
                deeperModalVC.dismiss(animated: animated) {
                    modalVC.dismiss(animated: animated, completion: completion)
                }
            }
            else {
                modalVC.dismiss(animated: animated, completion: completion)
            }
        }
        else {
            completion?()
        }
    }
    
    func setSelectedTab(_ index: TabBarIndex, popToRoot: Bool = false, animated: Bool = false) {
        if selectedIndex != index.rawValue {
            selectedIndex = index.rawValue
        }
        
        if popToRoot {
            (self.presentedViewController as? UINavigationController)?.popToRootViewController(animated: animated)
        }
    }
}
