//
//  MainPresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 18.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class MainPresenter {
    // MARK: - Properties
    var interactor: MainInteractor?
    var router: MainRouter?
    var viewController: MainViewController?
    
    // MARK: - Public methods
    func onViewWillAppear() -> Void {
        interactor?.getProfile(completion: { user in
            // TODO: implement loading indicator open/close
        })
        
        interactor?.getBaseInterests(completion: { baseInterests in
            // TODO: implement loading indicator open/close
        })
        
        interactor?.getUserInterests(completion: { userInterests in
            // TODO: implement loading indicator open/close
        })
    }
}
