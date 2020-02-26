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
    // MARK: - Properties
    var presenter: ProfilePresenter?
    
    private var userService: UserService?
    
    // MARK: - Public methods
    init(_ service: UserService) {
        userService = service
    }
    
    func getFormatterUserPhoneNumber() -> String {
        let phoneNumberKit = PhoneNumberKit()
        let firebaseStringNumber = Auth.auth().currentUser?.phoneNumber ?? ""
        var formattedPhoneNumber = ""
        
        if let phoneNumberObj = try? phoneNumberKit.parse(firebaseStringNumber) {
            formattedPhoneNumber = phoneNumberKit.format(phoneNumberObj, toType: .national)
        }
 
        return formattedPhoneNumber
    }
    
    func getUser() -> User {
        return userService?.user ?? User()
    }
    
    func updateNickname(with text: String) -> Void {
        userService?.updateNickname(text)
    }
    
    func updateBirthday(with date: Date) -> Void {
        userService?.updateBirthday(date)
    }
    
    func updateGender(with gender: Gender) -> Void {
        userService?.updateGender(gender)
    }
  
    func signOut() -> Void {
        try? Auth.auth().signOut()
    }
}
