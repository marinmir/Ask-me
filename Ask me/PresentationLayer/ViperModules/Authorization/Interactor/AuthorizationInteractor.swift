//
//  AuthorizationInteractor.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 04.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import PhoneNumberKit
import Firebase

class AuthorizationInteractor {
    
    init() {
    }
    
    func isValidPhoneNumber(phoneNumber number: String) -> Bool {
        let phoneNumberKit = PhoneNumberKit()
    
        return phoneNumberKit.isValidPhoneNumber(number)
    }
    
    func requestVerificationCode(for phoneNumber: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
            print(error.localizedDescription)
            return
          }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
        }
    }
    
    var presenter: AuthorizationPresenter?
}
