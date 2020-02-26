//
//  ProfileRouter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ProfileRouter {
    // MARK: - Public methods
    static func createModule() -> UIViewController {
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor(Assembly.userService)
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
    
    func openAuthorizationModule(with viewController: UIViewController) -> Void {
        viewController.view.window?.rootViewController = UINavigationController(rootViewController: AuthorizationRouter.createModule())
    }
}
