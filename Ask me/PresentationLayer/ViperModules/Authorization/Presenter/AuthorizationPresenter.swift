//
//  AuthorizationPresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class AuthorizationPresenter {
    
    init() {
    }
    
    func onSendBtn(with phoneNumber: String) {
        interactor?.requestVerificationCode(for: phoneNumber)
        
        router?.openVerificationModule(with: viewController)
    }
    
    func onPhoneNumberChanged(value: String) {
        if let isValidPhoneNumber = interactor?.isValidPhoneNumber(phoneNumber: value) {
            viewController?.setSendBtnEnabled(isValidPhoneNumber)
        }
    }
    
    var router: AuthorizationRouter?
    var viewController: AuthorizationViewController?
    var interactor: AuthorizationInteractor?
}
