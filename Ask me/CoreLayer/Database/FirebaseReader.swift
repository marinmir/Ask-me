//
//  FirebaseReader.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit
import Firebase

class FirebaseReader {
    // MARK: - Properties
    private let ref: DatabaseReference
    
    // MARK: - Public methods
    init() {
        ref = Database.database().reference()
    }
    
    func subscribeOnDictionary(forPath path: String, onChange callback: @escaping ([String: Any]) -> Void) {
        ref.child(path).observe(.value, with: { snapshot in
            guard let json = snapshot.value as? [String: Any] else {
                callback([:])
                return
            }
            
            callback(json)
        })
    }
    
    func subscribeOnArray(forPath path: String, onChange callback: @escaping ([[String: Any]]) -> Void) {
        ref.child(path).observe(.value, with: { snapshot in
            guard let json = snapshot.value as? [[String: Any]] else {
                return
            }
            
            callback(json)
        })
    }
    
    func subscribeOnStringArray(forPath path: String, onChange callback: @escaping ([String]) -> Void) {
        ref.child(path).observe(.value, with: { snapshot in
            guard let json = snapshot.value as? [String] else {
                return
            }
            
            callback(json)
        })
    }
}
