//
//  ActivitiesViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class ActivitiesViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: ActivitiesFlowController!
    private let activityService: ActivityService!
    
    let dataSource: ActivitiesDataSource!
    
    
    let allTypes: [ActivityType] = [.accident, .doctorVisit, .hospitalVisit, .illness, .meal, .movement, .measurement, .medication, .vaccination]
    var selectedFilterType: ActivityType?

    // MARK: Lifecycle methods
    init(flowController: ActivitiesFlowController,
         dataSource: ActivitiesDataSource = ActivitiesDataSource(),
         activityService: ActivityService = ActivityService()) {
        
        self.flowController = flowController
        self.dataSource = dataSource
        self.activityService = activityService
        super.init()
    }
    
    
    func updateActivities(_ completion: (() -> Void)? = nil)  {
        activityService.fetchActivities { (loadedActivities, error) in
            guard let activities = loadedActivities else {
                return
            }
            if let selectedFilter = self.selectedFilterType {
                let filteredActivities = activities.filter { (anActivity) -> Bool in
                    return anActivity.getActivityType() == selectedFilter
                }
                self.dataSource.activitySections = self.createSections(with: filteredActivities)
            }
            else {
                self.dataSource.activitySections = self.createSections(with: activities)
            }
            
            completion?()
        }
    }
    
    func createSections(with activities: [Activity]) -> [ActivitySection] {
        let groupingDictionary = Dictionary(grouping: activities, by: { $0.getDate() })
        
        var sections: [ActivitySection] = [ActivitySection]()
        
        for key in groupingDictionary.keys {
            let date = key
            if let sectionActivities = groupingDictionary[key] {
                sections.append(ActivitySection(date: date, activities: sectionActivities))
            }
        }
        
        sections.sort(by: { lhs, rhs in
            return lhs.date > rhs.date
          })
        
        return sections
    }
    
    func didSelectActivity(at indexPath: IndexPath) {
        let activity = self.dataSource.getActivity(at: indexPath)
        flowController.openActivityDetails(selectedActivity: activity)
    }
    
    func didTapAdd() {
        flowController.openCreateActivity()
    }
}
