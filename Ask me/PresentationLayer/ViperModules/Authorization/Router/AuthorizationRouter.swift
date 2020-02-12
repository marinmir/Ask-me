//
//  AuthorizationRouter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationRouter {
    
    init() {
        
    }
    
    static func createModule() -> UIViewController {
        let presenter = AuthorizationPresenter()
        let viewController = AuthorizationViewController()
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter()
        
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.viewController = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return viewController
    }
    
    func openVerificationModule(with viewController: UIViewController?) {
        viewController?.navigationController?.pushViewController(VerificationRouter.createModule(), animated: true)
    }
}
