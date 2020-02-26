//
//  GenderCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 25.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class GenderCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "GenderCell"
    
    private let genderPickerItems = [Gender(rawValue: 0)!.toString(), Gender(rawValue: 1)!.toString()]
    private let genderLabel = UILabel()
    private let genderTextField = UITextField()
    private let genderPicker = UIPickerView()
    private var vc: ProfileViewController
    
    // MARK: - Public methods
    init (viewController vc: ProfileViewController) {
        self.vc = vc

        super.init(style: .default, reuseIdentifier: GenderCell.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setContent(userGender gender: Gender) -> Void {
        genderTextField.text = genderPickerItems[gender.rawValue]
        genderPicker.selectRow(gender.rawValue, inComponent: 0, animated: true)
    }
    
    @objc
    func doneGenderPickerPressed() -> Void {
        endEditing(true)
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender"
        genderLabel.textAlignment = .left
        contentView.addSubview(genderLabel)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneGenderPickerPressed))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        genderTextField.textAlignment = .right
        genderTextField.delegate = self
        genderTextField.inputView = genderPicker
        genderTextField.inputAccessoryView = toolBar
        contentView.addSubview(genderTextField)
        
        NSLayoutConstraint.activate([
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            genderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            genderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            genderLabel.widthAnchor.constraint(equalToConstant: 100),
            genderLabel.heightAnchor.constraint(equalToConstant: 44),
            
            genderTextField.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 4),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            genderTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

//MARK: - UIPickerViewDataCource
extension GenderCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
}

// MARK: - UIPickerViewDelegate
extension GenderCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPickerItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderPickerItems[row]
    }
}

// MARK: - UITextFieldDelegate
extension GenderCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) -> Void {
        let gender = Gender(rawValue: genderPicker.selectedRow(inComponent: 0))
        vc.onGenderEditingFinished(with: gender!)
    }
}
