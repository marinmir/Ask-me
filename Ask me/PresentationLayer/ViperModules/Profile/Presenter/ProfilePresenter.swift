//
//  ProfilePresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class ProfilePresenter {
    // MARK: - Properties
    var interactor: ProfileInteractor?
    var router: ProfileRouter?
    var viewController: ProfileViewController?
    
    // MARK: - Public methods
    func getUserPhoneNumber() -> String {
        return interactor?.getFormatterUserPhoneNumber() ?? ""
    }
    
    func getUser() -> User {
        return interactor?.getUser() ?? User()
    }
    
    func onSignOutCell() -> Void {
        interactor?.signOut()
        router?.openAuthorizationModule(with: viewController!)
    }
    
    func onNewNickname(with text: String) -> Void {
        interactor?.updateNickname(with: text)
    }
    
    func onNewBirthday(with date: Date) -> Void {
        interactor?.updateBirthday(with: date)
    }
    
    func onNewGender(with gender: Gender) -> Void {
           interactor?.updateGender(with: gender)
       }
}
