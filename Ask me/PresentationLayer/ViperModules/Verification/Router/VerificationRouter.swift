//
//  VerificationRouter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class VerificationRouter {
    
    static func createModule() -> UIViewController {
        let presenter = VerificationPresenter()
        let interactor = VerificationInteractor()
        let viewController = VerificationViewController()
        let router = VerificationRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        
        interactor.presenter = presenter
        
        viewController.presenter = presenter
        
        return viewController
    }
    
    func openMainModule(with viewController: UIViewController) {
        viewController.view.window?.rootViewController = MainRouter.createModule()
    }
}
