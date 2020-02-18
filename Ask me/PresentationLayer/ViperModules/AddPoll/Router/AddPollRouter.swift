//
//  AddPollRouter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AddPollRouter {
    static func createModule() -> UIViewController {
        let viewController = AddPollViewController()
               let interactor = AddPollInteractor()
               let presenter = AddPollPresenter()
               let router = AddPollRouter()
               
               viewController.presenter = presenter
               
               presenter.interactor = interactor
               presenter.router = router
               presenter.viewController = viewController
               
               interactor.presenter = presenter
               
               return viewController
    }
}
