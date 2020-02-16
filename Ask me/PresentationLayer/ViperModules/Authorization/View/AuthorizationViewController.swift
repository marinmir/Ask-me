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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func loadView() {
        super.loadView()
        
        view = AuthorizationView(viewController: self)
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(sender: NSNotification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y = -keyboardHeight/2
        }
    }
    
    @objc
    func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
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
