//
//  testDB.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class testDB {
    
    init() {
        ref = Database.database().reference()
    }
    
    private let ref: DatabaseReference!
}
