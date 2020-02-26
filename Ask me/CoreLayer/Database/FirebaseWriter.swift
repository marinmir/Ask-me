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
    // MARK: - Properties
    private let ref: DatabaseReference
    
    // MARK: - Public methods
    init() {
        ref = Database.database().reference()
    }
    
    func addDictionary(for path: String, with dict: [String : Any]) -> Void {
        self.ref.child(path).setValue(dict)
    }
    
    func addString(for path: String, with text: String) -> Void {
        self.ref.child(path).setValue(text)
    }
    
    func addNumber(for path: String, with number: Int) -> Void {
        self.ref.child(path).setValue(number)
    }
}
