//
//  VerificationView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class VerificationView: UIView {
    // MARK: - Properties
    private weak var vc: VerificationViewController?
    
    private let verificationTextField = UITextField()
    private let enterButton = UIButton()
    private let backgroundView = UIImageView(image: UIImage(named: "VerificationBackground"))
    
    // MARK: - Public methods
    init(viewController vc: VerificationViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setActiveEnterBtn() -> Void {
        enterButton.isEnabled = true
        enterButton.backgroundColor = Palette.darkCoffeeColor
    }
    
    func setInactiveEnterBtn() -> Void {
        enterButton.isEnabled = false
        enterButton.backgroundColor = Palette.coffeeColor
    }
    
    func getVerificationCode() -> String {
        return verificationTextField.text ?? ""
    }
    
    // MARK: - Private methods
    @objc
    private func hideKeyboard() -> Void {
        if verificationTextField.isFirstResponder {
            verificationTextField.resignFirstResponder()
        }
    }
    
    private func setAppearance() -> Void {
        self.backgroundColor = UIColor.white
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        backgroundView.addGestureRecognizer(tapGesture)
        backgroundView.isUserInteractionEnabled = true
        addSubview(backgroundView)
        
        verificationTextField.delegate = vc
        verificationTextField.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 12.0, *) {
            verificationTextField.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        verificationTextField.keyboardType = .numberPad
        verificationTextField.placeholder = "Verification code"
        verificationTextField.layer.cornerRadius = 5
        verificationTextField.layer.borderWidth = 1
        verificationTextField.layer.borderColor = Palette.darkCoffeeColor.cgColor
        verificationTextField.backgroundColor = Palette.almostWhite
        verificationTextField.textColor = Palette.darkCoffeeColor
        addSubview(verificationTextField)
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        setInactiveEnterBtn()
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitleColor(Palette.almostWhite, for: .normal)
        enterButton.layer.cornerRadius = 5
        enterButton.layer.borderColor = Palette.darkCoffeeColor.cgColor
        enterButton.layer.borderWidth = 1
        enterButton.addTarget(vc, action: #selector(vc!.onEnterBtn), for: .touchUpInside)
        addSubview(enterButton)
        
         NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            verificationTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            verificationTextField.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            verificationTextField.heightAnchor.constraint(equalToConstant: 40),
            verificationTextField.widthAnchor.constraint(equalToConstant: 250),
            
            enterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            enterButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 15),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
