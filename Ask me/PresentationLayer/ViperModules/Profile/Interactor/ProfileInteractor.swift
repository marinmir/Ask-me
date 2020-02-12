//
//  ProfileInteractor.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase
import PhoneNumberKit

class ProfileInteractor {
    
    func getFormatterUserPhoneNumber()-> String {
        let phoneNumberKit = PhoneNumberKit()
        let firebaseStringNumber = Auth.auth().currentUser?.phoneNumber ?? ""
        var formattedPhoneNumber = ""
        
        if let phoneNumberObj = try? phoneNumberKit.parse(firebaseStringNumber) {
            formattedPhoneNumber = phoneNumberKit.format(phoneNumberObj, toType: .national)
        }
 
        return formattedPhoneNumber
    }
  
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    var presenter: ProfilePresenter?
}
