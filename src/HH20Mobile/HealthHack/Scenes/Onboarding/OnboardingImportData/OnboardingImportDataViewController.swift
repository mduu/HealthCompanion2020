//
//  OnboardingImportDataViewController.swift
//  HealthHack
//
//  Created by Muhamed Ahmetovic on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class OnboardingImportDataViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, OnboardingImportDataInterfaceDelegate {
    
    // MARK: - Attributers
    var viewModel: OnboardingImportDataViewModel!
    let insurancePicker = UIPickerView()
    
    
    
    var user: User?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        initInsurancePicker()
        viewModel.onboardingImportDataInterfaceDelegate = self
        super.viewDidLoad()
        
        birthDatePicker.tintColor = .helsanaRot()
        insuranceField.text = self.viewModel?.getInsuranceProviders()[0]
        hideKeyboardWhenTappedAround()
    }
    
    @objc func cancelBirthDatePicker() {
        self.view.endEditing(true)
    }
    
    func initInsurancePicker() {
        self.insurancePicker.delegate = self as UIPickerViewDelegate
        self.insurancePicker.dataSource = self as UIPickerViewDataSource
        self.insurancePicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showInsurancePicker() {
        self.view.addSubview(insurancePicker)
        self.insurancePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.insurancePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.insurancePicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func updateUserDate(user: User?) {
        self.user = user
        DispatchQueue.main.async {
            self.lastNameField.text = user?.lastname
            self.firstNameField.text = user?.firstname
            self.addressFIeld.text = user?.street
            self.zipField.text = user?.zip
            self.cityField.text = user?.city
        }
    }
    
    @IBAction func onImportButtonPressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        self.viewModel.fetchUser(with: self.insuranceNumberField.text, birthDate: birthDatePicker.date)
    }
    
    func hideInsurancePicker() {
        self.insurancePicker.removeFromSuperview()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel?.getInsuranceProviders().count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewModel?.getInsuranceProviders()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        insuranceField.text = self.viewModel?.getInsuranceProviders()[row]
        view.endEditing(true)
    }
    
    @IBAction func onInsuranceFieldEntered(_ sender: Any) {
        showInsurancePicker()
    }
    
    @IBAction func onInsuranceFieldLeft(_ sender: Any) {
        hideInsurancePicker()
    }
    
    @IBAction func onContinueButtonPressed(_ sender: Any) {
        self.viewModel?.navigateToOnbaordingDocuments(user: self.user)
    }
    
    @IBOutlet weak var insuranceField: UITextField!
    @IBOutlet weak var insuranceNumberField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var addressFIeld: UITextField!
    @IBOutlet weak var zipField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet var birthDatePicker: UIDatePicker!
}
