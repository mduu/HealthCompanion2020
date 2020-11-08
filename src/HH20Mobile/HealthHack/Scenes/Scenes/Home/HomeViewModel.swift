//
//  HomeViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 05.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class HomeViewModel: NSObject {
    
    // MARK: Attributes
    private weak var viewController: HomeUserInterface!
    private var flowController: HomeFlowController!
    
    var dataSource = [SliderSectionItem]()

    // MARK: Lifecycle methods
    init(viewController: HomeUserInterface, flowController: HomeFlowController) {
        self.viewController = viewController
        self.flowController = flowController
        super.init()
    }
    
    
    func loadSliders(_ completion: (() -> Void)? = nil) {
        
        
        guard let userID = UserDefaults.standard.value(forKey: LoginConfig.kCurrentUserGUID) as? String else { return }
        
        if userID == LoginConfig.fitterHans {
            // Section 1
            var items1 = [SliderItem]()
            items1.append( SliderItem(id: nil, title: "Improve your endurance", subtitle: "Run 15km", image: UIImage(named: "running")) )
            items1.append( SliderItem(id: nil, title: "Strength Workout - Get even stronger", subtitle: "20x Squats, 20 Lunges, 20 Push-ups (repeat 3x)", image: UIImage(named: "workout-icon")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "Next Challenge", items: items1))
            
            
            // Section 2
            var items2 = [SliderItem]()
            items2.append( SliderItem(id: nil, title: "Adidas Running by Runtastic - Fitness", subtitle: "Start a training plan, challenge yourself, and get stronger with every workout", image: UIImage(named: "runtastic")) )
            items2.append( SliderItem(id: nil, title: "Asana Rebel- Get in Shape", subtitle: "2Get the best of health and fitness, all in one place", image: UIImage(named: "asana_rebel")) )
            items2.append( SliderItem(id: nil, title: "Freeletics Coach", subtitle: "Trainiere jederzeit und überall. Das bietet dir dein zu 100% individualisierter Coach.", image: UIImage(named: "freeletics")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "Keep fit and strong", items: items2))
           
            // Section 3
            var items3 = [SliderItem]()
            items3.append( SliderItem(id: nil, title: "myViavac The Swiss electronic vaccination record", subtitle: "Have access to your peersonal vaccination record from anywhere using your personal login and password", image: UIImage(named: "myViavac")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "Keep an eye on your Health", items: items3))
        }
        else {
            // Section 1
            var items1 = [SliderItem]()
            items1.append( SliderItem(id: nil, title: "Helsana Coach", subtitle: "Helsana Coach supports you in achieving your personal health goals and boosting your well-being as a result", image: UIImage(named: "HelsanaCoach")) )
            items1.append( SliderItem(id: nil, title: "meinDiabetes, the Diabetes App", subtitle: "meinDiabetes helps you to manage diabetes in your everyday life, independent if you have type-1 or type-2 diabetes", image: UIImage(named: "meinDiabetes")) )
            items1.append( SliderItem(id: nil, title: "siDiary", subtitle: "Living a simple live with Diabetes", image: UIImage(named: "diDiary")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "App Recommendations", items: items1))
            
            
            // Section 2
            var items2 = [SliderItem]()
            items2.append( SliderItem(id: nil, title: "Take a walk", subtitle: "Why not take a 30 minutes walk at the fresh air?", image: UIImage(named: "running")) )
            items2.append( SliderItem(id: nil, title: "Meditation", subtitle: "Take a break for 10 minutes and just focus on your breath", image: UIImage(named: "yoga")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "For a Good Feeling", items: items2))
           
            // Section 3
            var items3 = [SliderItem]()
            items3.append( SliderItem(id: nil, title: "myViavac The Swiss electronic vaccination record", subtitle: "Have access to your peersonal vaccination record from anywhere", image: UIImage(named: "myViavac")) )
            items3.append( SliderItem(id: nil, title: "Medication Reminder", subtitle: "Simply add your drug intake to your activities and set a reminder", image: UIImage(named: "reminder")) )
            
            self.dataSource.append( SliderSectionItem(sectionTitle: "Keep an eye on your Health", items: items3))
        }
        
       
        
        
    }
}
