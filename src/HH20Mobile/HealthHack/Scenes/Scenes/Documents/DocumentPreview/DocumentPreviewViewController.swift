//
//  DocumentPreviewViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 08.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit
import WebKit

class DocumentPreviewViewController: UIViewController {
    
    // MARK: - Attributers
    var viewModel: DocumentPreviewViewModel!
    
    @IBOutlet var webView: WKWebView!
    
    
    var fileURLString: String?
    var titleString: String?
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleString
        
        
        webView.backgroundColor = .hintergrundApp()
        webView.isOpaque = false
        view.backgroundColor = .hintergrundApp()
        
        if let string = fileURLString {
            if let url = URL(string: string) {
                var urlRequest = URLRequest(url: url)
                urlRequest.setValue(UserDefaults.standard.string(forKey: LoginConfig.kCurrentUserGUID)!, forHTTPHeaderField: "userid")
                webView.load(urlRequest)
            }
        }
        
    }
    
}
