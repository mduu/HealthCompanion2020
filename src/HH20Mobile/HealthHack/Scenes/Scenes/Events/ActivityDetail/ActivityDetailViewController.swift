//
//  ActivityDetailViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 07.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit
import WebKit

class ActivityDetailViewController: UIViewController , WKNavigationDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Attributers
    var viewModel: ActivityDetailViewModel!
    private var foodService = FoodService()
    private var imagePicker = UIImagePickerController()
    

    @IBOutlet var labelDescription: UILabel!
    @IBOutlet var labelDate: UILabel!
    
    @IBOutlet var buttonDocuments: ButtonLight!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var webview: WKWebView!
    
    @IBOutlet var buttonUploadFood: ButtonDark!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        updateContent()
        hideKeyboardWhenTappedAround()
    }
    
    func updateContent() {
        self.title = viewModel.activityDetails.getTitle()
        labelDescription.text = viewModel.activityDetails.getDescription()
        labelDate.text = DateHelper.getSwissTimeForDate(date: viewModel.activityDetails.getDate())
        imageView.image = viewModel.activityDetails.getIcon()
        
//        if let htmlString = viewModel.activityDetails.getDetails().removingPercentEncoding {
//
//            let htmlWithBody = "<body> \(htmlString) </body>"
//
//
//
//
//
//            let htmlWithTags = "<html> \(htmlWithBody) </html>"
//            webview.loadHTMLString(htmlWithTags, baseURL: Bundle.main.bundleURL)
//        }
            
        textView.attributedText = HTMLParser.attributedString(fromHTML: viewModel.activityDetails.getDetails(), textColor: .textPrimary(), normalFontSize: 20, headlineFontSize: 20, lineSpace: 34)
        
        buttonDocuments.setTitle("Documents (\(viewModel.activityDetails.getDocuments().count))     >", for: .normal)
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
//        webview.backgroundColor = .hintergrundApp()
//        webview.tintColor = .hintergrundApp()
//        webview.isOpaque = false
        
        imageView.tintColor = .helsanaRot()
        labelDescription.textColor = .textPrimary()
        labelDate.textColor = .textSecondary()
    }
    
}
