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
    
    private var userService: UserService
    private var interestService: InterestService
    
    // MARK: - Public methods
    init(withUserService us: UserService, withInterestService ins: InterestService) {
        userService = us
        interestService = ins
    }
    
    func getProfile(completion: @escaping (User) -> Void) -> Void {
        if let user = userService.user {
            completion(user)
        } else {
            userService.loadUser(completion: completion)
            
        }
    }
    
    func getBaseInterests(completion: @escaping ([String]) -> Void) -> Void {
        interestService.loadBaseInterests { (baseInterests: [String]) in
            completion(baseInterests)
        }
    }
    
    func getUserInterests(completion: @escaping ([String]) -> Void) -> Void {
        interestService.loadUserInterests { (userInterests: [String]) in
            completion(userInterests)
        }
    }
}
