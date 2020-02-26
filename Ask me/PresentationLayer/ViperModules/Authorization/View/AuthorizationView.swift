//
//  AuthorizationView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AuthorizationView: UIView {
    // MARK: - Properties
    private let phoneTextField = PhoneTextField()
    private let invitationLabel = UILabel()
    private let sendButton = UIButton()
    private let backgroundView = UIImageView(image: UIImage(named: "AuthorizationBackground"))
    
    private weak var vc: AuthorizationViewController?
    
    // MARK: - Public methods
    init(viewController vc: AuthorizationViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setActiveSendBtn() -> Void {
        sendButton.isEnabled = true
        sendButton.backgroundColor = Palette.darkTurquoiseColor
    }
    
    func setInactiveSendBtn() -> Void {
        sendButton.isEnabled = false
        sendButton.backgroundColor = Palette.turquoiseColor
    }
    
    func getPhoneNumberText() -> String {
        return phoneTextField.text ?? ""
    }
    
    // MARK: - Private methods
    @objc
    private func hideKeyboard() -> Void {
        if phoneTextField.isFirstResponder {
            phoneTextField.resignFirstResponder()
        }
    }
    
    private func setAppearance() -> Void {
        self.backgroundColor = Palette.coffeeColor
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        backgroundView.addGestureRecognizer(tapGesture)
        backgroundView.isUserInteractionEnabled = true
        addSubview(backgroundView)
        
        invitationLabel.text = "We will send SMS with verification code, please, enter your phone number"
        invitationLabel.numberOfLines = 0
        invitationLabel.translatesAutoresizingMaskIntoConstraints = false
        invitationLabel.textAlignment = .center
        invitationLabel.font = invitationLabel.font.withSize(18)
        invitationLabel.textColor = Palette.almostWhite
        addSubview(invitationLabel)
        
        phoneTextField.delegate = vc
        phoneTextField.withExamplePlaceholder = true
        phoneTextField.withPrefix = true
        phoneTextField.withFlag = true
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.borderColor = Palette.turquoiseColor.cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textContentType = .telephoneNumber
        phoneTextField.backgroundColor = Palette.almostWhite
        phoneTextField.textColor = Palette.darkTurquoiseColor
        addSubview(phoneTextField)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        setInactiveSendBtn()
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(Palette.almostWhite, for: .normal)
        sendButton.layer.cornerRadius = 5
        sendButton.layer.borderColor = Palette.almostWhite.cgColor
        sendButton.layer.borderWidth = 1
        sendButton.addTarget(vc, action: #selector(vc!.onSendBtn), for: .touchUpInside)
        addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            invitationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            invitationLabel.widthAnchor.constraint(equalToConstant: 250),
            invitationLabel.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -30),
            
            phoneTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40),
            phoneTextField.widthAnchor.constraint(equalToConstant: 250),
            
            sendButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 30),
            sendButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 250),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
