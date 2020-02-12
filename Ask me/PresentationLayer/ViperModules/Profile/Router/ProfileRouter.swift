//
//  ProfileRouter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter {
    
    static func createModule() -> UIViewController {
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
    
    func openAuthorizationModule(with viewController: UIViewController) {
        viewController.view.window?.rootViewController = UINavigationController(rootViewController: AuthorizationRouter.createModule())
    }
}
