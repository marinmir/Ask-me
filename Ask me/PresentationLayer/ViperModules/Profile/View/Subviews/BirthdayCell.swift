//
//  DatePicker.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class BirthdayCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "BirthdayCell"
    
    private let datePicker = UIDatePicker()
    private let birthdayLabel = UILabel()
    private let birthdayTextField = UITextField()
    private let dateFormatter = DateFormatter()
    private let vc: ProfileViewController
    
    // MARK: - Public methods
    init (viewController vc: ProfileViewController) {
        self.vc = vc
        dateFormatter.dateFormat = "dd-MM-yyyy"

        super.init(style: .default, reuseIdentifier: BirthdayCell.identifier)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(userBirthday birthday: Date) -> Void {
        birthdayTextField.text = dateFormatter.string(from: birthday)
        datePicker.date = birthday
    }
    
    @objc
    func doneDatePickerPressed() -> Void {
        endEditing(true)
    }

    //MARK: - Private methods
    private func setAppearance() -> Void {
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.text = "Birthday"
        birthdayLabel.textAlignment = .left
        contentView.addSubview(birthdayLabel)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePickerPressed))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(onPickerChanged), for: .valueChanged)
        
        birthdayTextField.translatesAutoresizingMaskIntoConstraints = false
        birthdayTextField.textAlignment = .right
        birthdayTextField.delegate = self
        birthdayTextField.inputView = datePicker
        birthdayTextField.inputAccessoryView = toolBar
        contentView.addSubview(birthdayTextField)
        
        NSLayoutConstraint.activate([
            birthdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            birthdayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            birthdayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            birthdayLabel.widthAnchor.constraint(equalToConstant: 100),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 44),
            
            birthdayTextField.leadingAnchor.constraint(equalTo: birthdayLabel.trailingAnchor, constant: 4),
            birthdayTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            birthdayTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            birthdayTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc
    private func onPickerChanged(sender: UIDatePicker) -> Void {
        birthdayTextField.text = dateFormatter.string(from: sender.date)
    }
}

//MARK: - UITextFieldDelegate
extension BirthdayCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) -> Void {
        vc.onBirthdayEditingFinished(with: dateFormatter.date(from: birthdayTextField.text!)!)
    }
}
