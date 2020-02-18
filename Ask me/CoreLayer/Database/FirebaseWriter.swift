//
//  FirebaseWriter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 19.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import Firebase

class FirebaseWriter {
    init() {
        ref = Database.database().reference()
    }
    
    func addDictionary(for path: String, with dict: [String : Any]) {
        self.ref.child(path).setValue(dict)
    }
    
    private let ref: DatabaseReference
}
