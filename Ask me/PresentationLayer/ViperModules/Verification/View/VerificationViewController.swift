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
    
    override func loadView() {
        super.loadView()
        
        view = VerificationView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
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
