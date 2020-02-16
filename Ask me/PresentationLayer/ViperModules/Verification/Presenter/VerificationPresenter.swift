//
//  VerificationPresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 05.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class VerificationPresenter {

    func onEnterBtn(with verificationCode: String) {
        interactor?.verifyCode(for: verificationCode)
    }
    
    func didAuthorizeUser() {
        guard let vc = viewController else {
            return
        }
        router?.openMainModule(with: vc)
    }
    
    var router: VerificationRouter?
    var interactor: VerificationInteractor?
    var viewController: VerificationViewController?
}
