//
//  AuthorizationViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    override func loadView() {
        super.loadView()
        
        view = AuthorizationView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    func onSendBtn() {
        presenter?.onSendBtn(with: _view.getPhoneNumberText())
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
            return false
        }
        
        presenter?.onPhoneNumberChanged(value: updatedString)
        
        return true
    }
    
    func setSendBtnEnabled(_ isValid: Bool) {
        if let authView = view as? AuthorizationView {
            isValid ? authView.setActiveSendBtn() : authView.setInactiveSendBtn()
        }
        
        
    }
      
    var presenter: AuthorizationPresenter?
    
    private var _view: AuthorizationView {
        get {
            return view as! AuthorizationView
        }
    }
}
