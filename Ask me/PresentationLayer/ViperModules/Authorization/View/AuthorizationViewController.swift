//
//  AuthorizationViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {
    // MARK: - Properties
    var presenter: AuthorizationPresenter?
    
    private var _view: AuthorizationView {
        get {
            return view as! AuthorizationView
        }
    }
    
    // MARK: - Public methods
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func loadView() -> Void {
        super.loadView()
        
        view = AuthorizationView(viewController: self)
    }
    
    override func viewDidLoad() -> Void {
       super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barTintColor = UIColor.clear
    }
    
    @objc
    func keyboardWillShow(sender: NSNotification) -> Void {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            view.frame.origin.y = -keyboardHeight/2
        }
    }
    
    @objc
    func keyboardWillHide(sender: NSNotification) -> Void {
         view.frame.origin.y = 0 // Move view to original position
    }
    
    @objc
    func onSendBtn() -> Void {
        presenter?.onSendBtn(with: _view.getPhoneNumberText())
    }
    
    func setSendBtnEnabled(_ isValid: Bool) -> Void {
        if let authView = view as? AuthorizationView {
            isValid ? authView.setActiveSendBtn() : authView.setInactiveSendBtn()
        }
    }
}

// MARK: - UITextFieldDelegate
extension AuthorizationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
            return false
        }
        
        presenter?.onPhoneNumberChanged(value: updatedString)
        
        return true
    }
}
