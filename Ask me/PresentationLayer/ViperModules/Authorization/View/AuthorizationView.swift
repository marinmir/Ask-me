//
//  AuthorizationView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationView: UIView {
    
    init(viewController vc: AuthorizationViewController) {
        _vc = vc
        
        super.init(frame: CGRect.zero)
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setActiveSendBtn() {
        _sendBtn.isEnabled = true
        _sendBtn.backgroundColor = Palette.darkTurquoiseColor
    }
    
    func setInactiveSendBtn() {
        _sendBtn.isEnabled = false
        _sendBtn.backgroundColor = Palette.turquoiseColor
    }
    
    func getPhoneNumberText() -> String {
        return _phoneTextField.text ?? ""
    }
    
    @objc
    private func _hideKeyboard() {
        if _phoneTextField.isFirstResponder {
            _phoneTextField.resignFirstResponder()
        }
    }
    
    private func _setAppearance() {
        self.backgroundColor = Palette.coffeeColor
        
        _backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(_hideKeyboard))
        _backgroundView.addGestureRecognizer(tapGesture)
        _backgroundView.isUserInteractionEnabled = true
        addSubview(_backgroundView)
        
        _invitationLabel.text = "We will send SMS with verification code, please, enter your phone number"
        _invitationLabel.numberOfLines = 0
        _invitationLabel.translatesAutoresizingMaskIntoConstraints = false
        _invitationLabel.textAlignment = .center
        _invitationLabel.font = _invitationLabel.font.withSize(18)
        _invitationLabel.textColor = Palette.almostWhite
        addSubview(_invitationLabel)
        
        _phoneTextField.delegate = _vc
        _phoneTextField.withExamplePlaceholder = true
        _phoneTextField.withPrefix = true
        _phoneTextField.withFlag = true
        _phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        _phoneTextField.layer.cornerRadius = 5
        _phoneTextField.layer.borderColor = Palette.turquoiseColor.cgColor
        _phoneTextField.layer.borderWidth = 1
        _phoneTextField.textContentType = .telephoneNumber
        _phoneTextField.backgroundColor = Palette.almostWhite
        _phoneTextField.textColor = Palette.darkTurquoiseColor
        addSubview(_phoneTextField)
        
        _sendBtn.translatesAutoresizingMaskIntoConstraints = false
        setInactiveSendBtn()
        _sendBtn.setTitle("Send", for: .normal)
        _sendBtn.setTitleColor(Palette.almostWhite, for: .normal)
        _sendBtn.layer.cornerRadius = 5
        _sendBtn.layer.borderColor = Palette.almostWhite.cgColor
        _sendBtn.layer.borderWidth = 1
        
        _sendBtn.addTarget(_vc, action: #selector(_vc.onSendBtn), for: .touchUpInside)
        addSubview(_sendBtn)
        
        NSLayoutConstraint.activate([
            _backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            _backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            _backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            _backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            _invitationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _invitationLabel.widthAnchor.constraint(equalToConstant: 250),
            _invitationLabel.bottomAnchor.constraint(equalTo: _phoneTextField.topAnchor, constant: -30),
            
            _phoneTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _phoneTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            _phoneTextField.heightAnchor.constraint(equalToConstant: 40),
            _phoneTextField.widthAnchor.constraint(equalToConstant: 250),
            
            _sendBtn.topAnchor.constraint(equalTo: _phoneTextField.bottomAnchor, constant: 30),
            _sendBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            _sendBtn.widthAnchor.constraint(equalToConstant: 250),
            _sendBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private let _phoneTextField = PhoneTextField()
    private let _invitationLabel = UILabel()
    private let _sendBtn = UIButton()
    private let _backgroundView = UIImageView(image: UIImage(named: "AuthorizationBackground"))
    private let _vc: AuthorizationViewController
}
