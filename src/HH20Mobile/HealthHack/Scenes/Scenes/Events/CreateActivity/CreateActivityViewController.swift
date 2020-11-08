//
//  CreateActivityViewController.swift
//  HealthHack
//
//  Created by Anatoli Benke on 06.11.20.
//  Copyright © 2020 Anatoli Benke. All rights reserved.
//
//  MVVM Template by ti8m.com
//

import Foundation
import UIKit

class CreateActivityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Attributers
    var viewModel: CreateActivityViewModel!
    private var imagePicker = UIImagePickerController()
    private var foodService = FoodService()
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    
    @IBOutlet var labelTitle:           UILabel!
    @IBOutlet var labelDescription:     UILabel!
    @IBOutlet var labelActivity:        UILabel!
    @IBOutlet var labelActivityType:    UILabel!
    
    @IBOutlet var textFieldTitle: UITextField!
    @IBOutlet var textFieldDescription: UITextField!
    @IBOutlet var datePickerActivity: UIDatePicker!
    
    @IBOutlet var textFieldActivityType: UITextField!
    @IBOutlet var imageViewActivityType: UIImageView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        self.title = "Create Activity"
        
        setupPicker()
        fotoUploadButton.isHidden = !(viewModel.selectedType == ActivityType.meal)
        setReminderButton.isHidden = !(viewModel.selectedType == ActivityType.medication)
        hideKeyboardWhenTappedAround()
    }
    
    private func applyStyle() {
        view.backgroundColor = .hintergrundApp()
        scrollView.backgroundColor = .hintergrundApp()
        contentView.backgroundColor = .hintergrundApp()
        datePickerActivity.tintColor = .helsanaRot()
        
        imageViewActivityType.tintColor = .helsanaRot()
        
        labelTitle.textColor = .textPrimary()
        labelDescription.textColor = .textPrimary()
        labelActivity.textColor = .textPrimary()
        labelActivityType.textColor = .textPrimary()
        
    }
    
    private func setupPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        textFieldActivityType.inputView = picker
    }
    
    @IBAction fileprivate func saveTapped() {
        viewModel.saveTapped(date: datePickerActivity.date, title: textFieldTitle.text, description: textFieldDescription.text)
    }
    
    @IBAction fileprivate func cancelTapped() {
        viewModel.cancelTapped()
    }
    
    @IBAction func onUploadFotoButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var fotoUploadButton: ButtonDark!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        if let photo = image.jpegData(compressionQuality: 1.0) {
            let encodingImage = photo.base64EncodedString()
            foodService.getFoodData(base64Image: encodingImage) { (foodData, error) in
                if let items = foodData?.items {
                    DispatchQueue.main.async {
                        self.viewModel.details.append("<body><html>")
                        for item in items {
                            self.viewModel.details.append("<p>" + item.item.name + "</p>")
                        }
                        self.viewModel.details.append("</html></body>")
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var setReminderButton: ButtonDark!
    
    @IBAction func onSetReminderPressed(_ sender: Any) {
        
    }
    
}


extension CreateActivityViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.allTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.allTypes[row].string()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldActivityType.text = viewModel.allTypes[row].string()
        imageViewActivityType.image = viewModel.allTypes[row].iconImage()
        viewModel.selectedType = viewModel.allTypes[row]
        fotoUploadButton.isHidden = !(viewModel.selectedType == ActivityType.meal)
        setReminderButton.isHidden = !(viewModel.selectedType == ActivityType.medication)
        view.endEditing(true)
    }
    
}
