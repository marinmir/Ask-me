//
//  InterestService.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase

class InterestService {
    // MARK: - Properties
    private var _userNumber: String?
    private(set) var userInterests: [String]?
    private(set) var baseInterests: [String]?
    private let _dbReader = FirebaseReader()
    private let _dbWriter = FirebaseWriter()
    
    // MARK: - Public methods
    func loadBaseInterests(completion: @escaping ([String]) -> Void)  {
        
        // get current phone number
        guard let userNumber = Auth.auth().currentUser?.phoneNumber
            else {
                return
        }
        _userNumber = userNumber
        _dbReader.subscribeOnStringArray(forPath: "/interests") { [unowned self] (interestsJson: [String]) in
            // initialize
            self.baseInterests = interestsJson
            
            // report that loading is completed
            completion(self.baseInterests ?? [])
        }
    }
    
    func loadUserInterests(completion: @escaping ([String]) -> Void)  {
         
         // get current phone number
         guard let userNumber = Auth.auth().currentUser?.phoneNumber
             else {
                 return
         }
         _userNumber = userNumber
         _dbReader.subscribeOnStringArray(forPath: "/users/\(userNumber)/interests") { [unowned self] (interestsJson: [String]) in
             // initialize
             self.userInterests = interestsJson
             
             // report that loading is completed
             completion(self.userInterests ?? [])
         }
     }
    
    func updateUserInterests(_ interests: [String]) -> Void {
        guard let userNumber = _userNumber else {
                   return
               }
        _dbWriter.addArray(for: "/users/\(userNumber)/interests", with: interests)
    }
}
