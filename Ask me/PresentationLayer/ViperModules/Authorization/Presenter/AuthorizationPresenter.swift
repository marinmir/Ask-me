//
//  AuthorizationPresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class AuthorizationPresenter {
    // MARK: - Properties
    var router: AuthorizationRouter?
    var viewController: AuthorizationViewController?
    var interactor: AuthorizationInteractor?
 
    // MARK: - Public methods
    func onSendBtn(with phoneNumber: String) -> Void {
        interactor?.requestVerificationCode(for: phoneNumber)
        
        router?.openVerificationModule(with: viewController)
    }
    
    func onPhoneNumberChanged(value: String) -> Void {
        if let isValidPhoneNumber = interactor?.isValid(phoneNumber: value) {
            viewController?.setSendBtnEnabled(isValidPhoneNumber)
        }
    }
}
