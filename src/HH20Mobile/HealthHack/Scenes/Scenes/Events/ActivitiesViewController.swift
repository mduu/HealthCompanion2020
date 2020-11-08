//
//  ActivitiesViewController.swift
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

class ActivitiesViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            let bundle = Bundle(for: TimelineTableViewCell.self)
            let nibUrl = bundle.url(forResource: ActivitiesDataSource.activityCellIdentifier, withExtension: "bundle")
            let timelineTableViewCellNib = UINib(nibName: ActivitiesDataSource.activityCellIdentifier, bundle: Bundle(url: nibUrl!)!)
            tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: ActivitiesDataSource.activityCellIdentifier)
        }
    }
    
    @IBOutlet var textFieldFilterPicker: UITextField!
    @IBOutlet var imageViewFilterPicker: UIImageView!
    
    // MARK: - Attributers
    var viewModel: ActivitiesViewModel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLargeTitle(enabled: true)
        applyStyle()
        
        tableView.dataSource = viewModel.dataSource
        tableView.scrollsToTop = false
        tableView.delegate = self
        
        let navBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navBarItem.tintColor = .helsanaRot()
        navigationItem.rightBarButtonItems = [navBarItem]
        
        
        setupPicker()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        updateActivities()
    }
    
    private func setupPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        textFieldFilterPicker.inputView = picker
    }
    
    private func setupView() {
        //tableView.tableFooterView = UITableViewHeaderFooterView()
        updateHeaderHeight()
    }
    
    func updateActivities() {
        DispatchQueue.main.async {
            Indicator.show(onView: self.view)
        }
        viewModel.updateActivities {
            DispatchQueue.main.async {
                Indicator.hide()
                self.tableView.reloadData()
            }
        }
    }
    
    private func updateHeaderHeight() {
        DispatchQueue.main.async { [weak self] in
            if let headerView = self?.tableView.tableHeaderView {
                let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
                var headerFrame = headerView.frame
                
                headerFrame.size.height = height
                headerView.frame = headerFrame
                self?.tableView.tableHeaderView = headerView
                self?.tableView.tableHeaderView?.setNeedsLayout()
                self?.tableView.tableHeaderView?.layoutIfNeeded()
            }
        }
    }
    
    @objc func addTapped() {
        viewModel.didTapAdd()
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
    }
    
}

extension ActivitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectActivity(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ActivitiesViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.allTypes.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row < viewModel.allTypes.count {
            return viewModel.allTypes[row].string()
        }
        else {
            return "All"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  row < viewModel.allTypes.count {
            textFieldFilterPicker.text = viewModel.allTypes[row].string()
            imageViewFilterPicker.image = viewModel.allTypes[row].iconImage()
            viewModel.selectedFilterType = viewModel.allTypes[row]
        }
        else {
            textFieldFilterPicker.text = "All"
            imageViewFilterPicker.image = nil
            viewModel.selectedFilterType = nil
        }
        if component == 0 {
            
            view.endEditing(true)
            self.updateActivities()
        }
    }
}
