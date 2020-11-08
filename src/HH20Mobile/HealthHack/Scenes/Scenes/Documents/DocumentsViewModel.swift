//
//  DocumentsViewModel.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation

class DocumentsViewModel: NSObject {
    
    // MARK: Attributes
    private var flowController: DocumentsFlowController!
    
    private let documentsService: DocumentsService!
    
    
    let dataSource: DocumentsDataSource!

    // MARK: Lifecycle methods
    init(flowController: DocumentsFlowController,
         dataSource: DocumentsDataSource = DocumentsDataSource(),
         documentsService: DocumentsService = DocumentsService()) {
        self.flowController = flowController
        self.documentsService = documentsService
        self.dataSource = dataSource
        super.init()
    }
    
    
    func updateDocuments(_ completion: (() -> Void)? = nil)  {
        documentsService.fetchDocuments { (loadedDocuments, error) in
            if let docs = loadedDocuments {
                self.dataSource.documentSections = self.createSections(with: docs)
            }
            completion?()
        }
    }
    
    func createSections(with activities: [Document]) -> [DocumentSection] {
        let groupingDictionary = Dictionary(grouping: activities, by: { $0.getDocumentTimeDate() })
        
        var sections: [DocumentSection] = [DocumentSection]()
        
        for key in groupingDictionary.keys {
            let date = key
            if let sectionDocuments = groupingDictionary[key] {
                sections.append(DocumentSection(date: date, documents: sectionDocuments))
            }
        }
        
        sections.sort(by: { lhs, rhs in
            return lhs.date > rhs.date
          })
        
        return sections
    }
    
    func didSelectDocument(at indexPath: IndexPath) {
        let document = self.dataSource.getDocument(at: indexPath)
        //flowController.openActivityDetails(selectedActivity: activity)
        
//        documentsService.fetchDocumentFile(id: document.id) { (url, error) in
//            if let myURL = url {
        self.flowController.openDocument(urlString: "https://hh20app.azurewebsites.net/api/documents/\(document.id)", title: document.title)
//            }
//        }
    }
    
}
