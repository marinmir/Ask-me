//
//  MainInteractor.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 18.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase

class MainInteractor {
    init() {
    }
    
    func getProfile()  {
        var user: User! = nil
        
        // get current phone number
        guard let userNumber = Auth.auth().currentUser?.phoneNumber
            else {
                return
        }
        
        _dbReader.subscribeOnDictionary(forPath: "users") { (usersJson: [String : Any]) in
            // check if usersJson contains phone number
            if usersJson[userNumber] != nil {
                guard let userData = try? JSONSerialization.data(withJSONObject: usersJson[userNumber]!) else {
                    assert(false)
                    return
                }
                
                guard let decodedUser = try? JSONDecoder().decode(User.self, from: userData) else {
                    assert(false)
                    return
                }
                user = decodedUser
            } else {
                user = User()
                guard let data = try? JSONEncoder().encode(user) else {
                    assert(false)
                    return
                }
                
                guard let userJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    assert(false)
                    return
                }
                
                self._dbWriter.addDictionary(for: "users/\(userNumber)", with: userJson)
            }
            
            // report that loading is completed
        }
    }
    
    var presenter: MainPresenter?
    private let _dbReader = FirebaseReader()
    private let _dbWriter = FirebaseWriter()
}
