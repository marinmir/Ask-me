//
//  MainInteractor.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 18.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class MainInteractor {
    // MARK: - Properties
    var presenter: MainPresenter?
    
    private var service: UserService
    
    // MARK: - Public methods
    init(_ service: UserService) {
        self.service = service
    }
    
    func getProfile(completion: @escaping (User) -> Void) -> Void {
        if let user = service.user {
            completion(user)
        } else {
            service.loadUser(completion: completion)
        }
    }
}
