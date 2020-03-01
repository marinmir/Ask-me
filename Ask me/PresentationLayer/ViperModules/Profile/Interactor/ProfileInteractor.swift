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
    private var interestService: InterestService?
    
    // MARK: - Public methods
    init(userService us: UserService, interestService ins: InterestService) {
        userService = us
        interestService = ins
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
    
    func getBaseInterests() -> [String] {
        return interestService?.baseInterests ?? []
    }
    
    func getUserInterests() -> [String] {
        return interestService?.userInterests ?? []
    }
    
    func updateInterests(_ interests: [String]) {
        guard let user = userService?.user else {
            return
        }
        user.interests? = interests
        interestService?.updateUserInterests(interests)
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
