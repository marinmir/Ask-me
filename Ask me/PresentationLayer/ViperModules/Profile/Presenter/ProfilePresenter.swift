//
//  ProfilePresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    func getUserPhoneNumber() -> String {
        return interactor?.getFormatterUserPhoneNumber() ?? ""
    }
    
    func onSignOutCell() {
        interactor?.signOut()
        router?.openAuthorizationModule(with: viewController!)
    }
    
    var interactor: ProfileInteractor?
    var router: ProfileRouter?
    var viewController: ProfileViewController?
}
