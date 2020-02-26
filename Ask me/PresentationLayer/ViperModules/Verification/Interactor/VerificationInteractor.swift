//
//  VerificationInteractor.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 05.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase

class VerificationInteractor {
    // MARK: - Properties
     var presenter: VerificationPresenter?
    
    // MARK: - Public methods
    func verifyCode(for verificationCode: String) -> Void {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            
            // User is signed in
            self.presenter?.didAuthorizeUser()
        }
    }
}
