//
//  VerificationView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class VerificationView: UIView {
    
    init(viewController vc: VerificationViewController) {
        _vc = vc
        
        super.init(frame: CGRect.zero)
        _setAppearance()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setActiveEnterBtn() {
        _enterBtn.isEnabled = true
        _enterBtn.backgroundColor = Palette.darkCoffeeColor
    }
    
    func setInactiveEnterBtn() {
        _enterBtn.isEnabled = false
        _enterBtn.backgroundColor = Palette.coffeeColor
    }
    
    func getVerificationCode()->String {
        return _verificationTextField.text ?? ""
    }
    
    @objc
    private func _hideKeyboard() {
        if _verificationTextField.isFirstResponder {
            _verificationTextField.resignFirstResponder()
        }
    }
    
    private func _setAppearance() {
        self.backgroundColor = UIColor.white
        
        _backgroundView.translatesAutoresizingMaskIntoConstraints = false
        _backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(_hideKeyboard))
        _backgroundView.addGestureRecognizer(tapGesture)
        _backgroundView.isUserInteractionEnabled = true
        addSubview(_backgroundView)
        
        _verificationTextField.delegate = _vc
        _verificationTextField.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 12.0, *) {
            _verificationTextField.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        _verificationTextField.keyboardType = .numberPad
        _verificationTextField.placeholder = "Verification code"
        _verificationTextField.layer.cornerRadius = 5
        _verificationTextField.layer.borderWidth = 1
        _verificationTextField.layer.borderColor = Palette.darkCoffeeColor.cgColor
        _verificationTextField.backgroundColor = Palette.almostWhite
        _verificationTextField.textColor = Palette.darkCoffeeColor
        addSubview(_verificationTextField)
        
        _enterBtn.translatesAutoresizingMaskIntoConstraints = false
        setInactiveEnterBtn()
        _enterBtn.setTitle("Enter", for: .normal)
        _enterBtn.setTitleColor(Palette.almostWhite, for: .normal)
        _enterBtn.layer.cornerRadius = 5
        _enterBtn.layer.borderColor = Palette.darkCoffeeColor.cgColor
        _enterBtn.layer.borderWidth = 1
        _enterBtn.addTarget(_vc, action: #selector(_vc.onEnterBtn), for: .touchUpInside)
        addSubview(_enterBtn)
        
         NSLayoutConstraint.activate([
            _backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            _backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            _backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            _backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            _verificationTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _verificationTextField.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            _verificationTextField.heightAnchor.constraint(equalToConstant: 40),
            _verificationTextField.widthAnchor.constraint(equalToConstant: 250),
            
            _enterBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _enterBtn.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 15),
            _enterBtn.heightAnchor.constraint(equalToConstant: 40),
            _enterBtn.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
        
        private let _vc: VerificationViewController
        private let _verificationTextField = UITextField()
        private let _enterBtn = UIButton()
        private let _backgroundView = UIImageView(image: UIImage(named: "VerificationBackground"))
}
