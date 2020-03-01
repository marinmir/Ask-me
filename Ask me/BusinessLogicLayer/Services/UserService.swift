//
//  UserService.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 20.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase

class UserService {
    // MARK: - Properties
    private var _userNumber: String?
    private(set) var user: User?
    private let _dbReader = FirebaseReader()
    private let _dbWriter = FirebaseWriter()
    
    // MARK: - Public methods
    func loadUser(completion: @escaping (User) -> Void)  {
        
        // get current phone number
        guard let userNumber = Auth.auth().currentUser?.phoneNumber
            else {
                return
        }
        _userNumber = userNumber
        _dbReader.subscribeOnDictionary(forPath: "/users") { [unowned self] (usersJson: [String : Any]) in
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
                self.user = decodedUser
            } else {
                self.user = User()
                guard let data = try? JSONEncoder().encode(self.user) else {
                    assert(false)
                    return
                }
                
                guard let userJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    assert(false)
                    return
                }
                
                self._dbWriter.addDictionary(for: "/users/\(userNumber)", with: userJson)
            }
            
            // report that loading is completed
            completion(self.user!)
        }
    }
    
    func updateNickname(_ nickname: String) -> Void {
        guard let userNumber = _userNumber else {
            return
        }
        user?.nickname = nickname
        _dbWriter.addString(for: "/users/\(userNumber)/nickname", with: nickname)
    }
    
    func updateBirthday(_ date: Date) -> Void {
        guard let userNumber = _userNumber else {
                   return
               }
        user?.birthday = date
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        _dbWriter.addString(for: "/users/\(userNumber)/birthday", with: df.string(from: date))
    }
    
    func updateGender(_ gender: Gender) -> Void {
        guard let userNumber = _userNumber else {
            return
        }
        user?.gender = gender
        let number = gender.rawValue
        _dbWriter.addNumber(for: "/users/\(userNumber)/gender", with: number)
    }
}
