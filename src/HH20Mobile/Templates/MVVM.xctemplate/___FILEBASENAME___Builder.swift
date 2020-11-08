//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
//  MVVM Template by ti8m.com
//

import UIKit

struct ___FILEBASENAMEASIDENTIFIER___ {
    func build() -> ___VARIABLE_productName:identifier___ViewController {
        let viewController: ___VARIABLE_productName:identifier___ViewController = UIStoryboard.instantiateInitialViewController()
        let flowController = ___VARIABLE_productName:identifier___FlowController(viewController: viewController)
        let viewModel = ___VARIABLE_productName:identifier___ViewModel(flowController: flowController)
        viewController.viewModel = viewModel
        return viewController
    }
}

