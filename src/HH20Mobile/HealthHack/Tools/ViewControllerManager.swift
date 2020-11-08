//
//  ViewControllerManager.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
import Foundation
import UIKit

final class ViewControllerManager {
    
    static let shared = ViewControllerManager()
    private init() {}

    func showInitialVC(isOnboarding: Bool = false) {
        if isOnboarding {
            setOnboardingAsInitialVC()
        }
        else {
            setNavigationTabbarVCAsInitialVC()
        }
    }
    
    func showLoginVC() {
        setLoginVCAsInitialVC()
    }
    
    func setLoginVCAsInitialVC() {
        let window = getActiveWindow()
        let loginVC = LoginBuilder().build()
        setInitialVC(vc: loginVC)
    }
    
    func setNavigationTabbarVCAsInitialVC() {
        let window = getActiveWindow()
        if !(window.rootViewController is NavigationTabbarViewController){
            let tabbar: NavigationTabbarViewController = UIStoryboard.instantiateInitialViewController()
            setInitialVC(vc: tabbar)
        }
    }
    
    func setOnboardingAsInitialVC() {
        let window = getActiveWindow()
        if !(window.rootViewController is NavigationTabbarViewController) {
            
            let onboardingVC = OnboardingStartBuilder().build()
            let navigationController = NavigationControllerFactory.create(withRootViewController: onboardingVC)

            setInitialVC(vc: navigationController)
        }
    }
    
    func showViewController(vc: UIViewController) {
        UIApplication.topViewController()?.present(vc, animated: true, completion: nil)
    }
    
    private func setInitialVC(vc: UIViewController?) {
        let window = getActiveWindow()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

    private func getActiveWindow() -> UIWindow {
        if let window = UIApplication.shared.delegate?.window {
            return window ?? UIWindow(frame: UIScreen.main.bounds)
        }
        return UIWindow(frame: UIScreen.main.bounds)
    }
}
