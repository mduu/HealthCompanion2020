//
//  DocumentsFlowController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import UIKit

class DocumentsFlowController: NSObject {
    
    // MARK: - Attributes
    private let viewController: DocumentsViewController!
    
    init(viewController: DocumentsViewController) {
        self.viewController = viewController
        super.init()
    }
    
    
    func openDocument(urlString: String, title: String) {
        let vc = DocumentPreviewBuilder().build(fileUrl: urlString, title: title)
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Navigation methods
}
