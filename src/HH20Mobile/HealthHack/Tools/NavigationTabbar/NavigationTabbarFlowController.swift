//
//  NavigationTabbarFlowController.swift
//  Helsana
//
//  Created by Anatoli Benke on 07.05.20.
//  Copyright © 2020 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

// MARK: Flow
class NavigationTabbarFlowController {
    
    // MARK: Create
    func createViewControllers() -> [UIViewController] {
        return [createHomeVC(), createActivitiesVC(), createDocumentsVC(), createUploadVC(), createServiceProviderVC(), createProfileVC()]
    }
}

// MARK: ViewController initialisation & TabbarItem creation
extension NavigationTabbarFlowController {
    
    private func createHomeVC() -> UINavigationController {
        let homeVC: HomeViewController = HomeBuilder().build()
        homeVC.title = "Home"
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Home",
                                                            image: UIImage(named: "Nav-Bar-Icon--Home"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Home--Active"))
        
        tabBarItem.tag = TabBarIndex.home.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.home)"
        
        homeVC.tabBarItem = tabBarItem
        
        let navigationController = NavigationControllerFactory.create(withRootViewController: homeVC)
        
        return navigationController
    }
    
    private func createActivitiesVC() -> UINavigationController {
        let activityVC = ActivitiesBuilder().build()
        activityVC.title = "Activity"
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Activity",
                                                            image: UIImage(named: "Nav-Bar-Icon--Sammeln"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Sammeln--Active"))
        
        tabBarItem.tag = TabBarIndex.activity.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.activity)"
        
        activityVC.tabBarItem = tabBarItem
        
        let navigationController = NavigationControllerFactory.create(withRootViewController: activityVC)
        
        return navigationController
    }
    
    
    private func createDocumentsVC() -> UINavigationController {
        let documentsVC = DocumentsBuilder().build()
        documentsVC.title = "Documents"
        
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Documents",
                                                            image: UIImage(named: "Nav-Bar-Icon--Einlosen"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Einlosen--Active"))
        
        tabBarItem.tag = TabBarIndex.documents.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.documents)"
        
        documentsVC.tabBarItem = tabBarItem
        
        let naviVC = NavigationControllerFactory.create(withRootViewController: documentsVC)
        
        return naviVC
    }
    
    private func createUploadVC() -> UIViewController {
        let shareVC = ShareBuilder().build()
        shareVC.title = "Share"
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Share",
                                                            image: UIImage(named: "Nav-Bar-Icon--Bonuslevel"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Bonuslevel--Active"))
        
        tabBarItem.tag = TabBarIndex.share.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.share)"
        
        shareVC.tabBarItem = tabBarItem
        
        let navController = NavigationControllerFactory.create(withRootViewController: shareVC)
        
        return navController
    }
    
    private func createServiceProviderVC() -> UIViewController {
        let serviceProviderVC = ServiceProviderBuilder().build()
        serviceProviderVC.title = "Service"
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Service",
                                                            image: UIImage(named: "Nav-Bar-Icon--Profile"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Profile--Active"))
        
        tabBarItem.tag = TabBarIndex.serviceProvicer.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.serviceProvicer)"
        
        serviceProviderVC.tabBarItem = tabBarItem
        
        let navController = NavigationControllerFactory.create(withRootViewController: serviceProviderVC)
        return navController
    }
    
    private func createProfileVC() -> UIViewController {
        let profileVC = ProfileBuilder().build()
        profileVC.title = "Profile"
        let tabBarItem = TabBarItemFactory.createTabBarItem(title: "Profile",
                                                            image: UIImage(named: "Nav-Bar-Icon--Profile"),
                                                            imageSelected: UIImage(named: "Nav-Bar-Icon--Profile--Active"))
        
        tabBarItem.tag = TabBarIndex.profile.rawValue
        tabBarItem.accessibilityLabel = "\(TabBarIndex.profile)"
        
        profileVC.tabBarItem = tabBarItem
        
        let navController = NavigationControllerFactory.create(withRootViewController: profileVC)
        return navController
    }
}
