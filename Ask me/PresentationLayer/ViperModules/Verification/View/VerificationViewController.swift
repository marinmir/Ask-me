//
//  VerificationViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class VerificationViewController: UIViewController, UITextFieldDelegate {
   
    deinit {
        NotificationCenter.default.removeObserver(self)
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
    
    override func loadView() {
        super.loadView()
        
        view = VerificationView(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = Palette.almostWhite
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 6
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        
        let shouldAcceptInput = newString.length <= maxLength
        
        if newString.length != maxLength {
             _view.setInactiveEnterBtn()
        } else {
            _view.setActiveEnterBtn()
        }
        
        return shouldAcceptInput
    }
    
    @objc
    func onEnterBtn() {
        presenter?.onEnterBtn(with: _view.getVerificationCode())
    }
    
    var presenter: VerificationPresenter?
    
    private var _view: VerificationView {
        get {
            return view as! VerificationView
        }
    }
}
