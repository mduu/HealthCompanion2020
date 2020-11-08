//
//  DocumentsViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit
import TimelineTableViewCell

class DocumentsViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: DocumentsViewModel!
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            let bundle = Bundle(for: TimelineTableViewCell.self)
            let nibUrl = bundle.url(forResource: DocumentsDataSource.documentCellIdentifier, withExtension: "bundle")
            let timelineTableViewCellNib = UINib(nibName: DocumentsDataSource.documentCellIdentifier, bundle: Bundle(url: nibUrl!)!)
            tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: DocumentsDataSource.documentCellIdentifier)
        }
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLargeTitle(enabled: true)
        applyStyle()
        
        tableView.dataSource = viewModel.dataSource
        tableView.scrollsToTop = false
        tableView.delegate = self
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateDocuments()
    }
    
    
    func updateDocuments() {
        DispatchQueue.main.async {
            Indicator.show(onView: self.view)
        }
        viewModel.updateDocuments() {
            DispatchQueue.main.async {
                Indicator.hide()
                self.tableView.reloadData()
            }
        }
    }
    
    
}


extension DocumentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectDocument(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
