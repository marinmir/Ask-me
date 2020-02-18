//
//  File.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 06.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class MainRouter {
    
    static func createModule() -> UIViewController {
        let vc = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = vc
        
        vc.presenter = presenter
        
        return vc
    }
}
