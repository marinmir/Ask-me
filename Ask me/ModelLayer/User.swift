//
//  User.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 29.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

enum Gender: Int {
    case male = 0
    case female
}

class User: Codable {
    var nickname: String
    var birthday: Date
    var gender: Gender
    var interests: [String]
    
    enum CodingKeys: String, CodingKey {
      case nickname
        case birthday
        case gender
        case interests
    }
    
    init() {
        nickname = ""
        birthday = Date()
        gender = .male
        interests = []
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        nickname = try container.decode(String.self, forKey: .nickname)
        
        birthday = try container.decode(Date.self, forKey: .birthday)
        
        let genderCode = try container.decode(Int.self, forKey: .gender)
        gender = Gender(rawValue: genderCode)!
        
        interests = try container.decode([String].self, forKey: .interests)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(nickname, forKey: .nickname)
        
        try container.encode(birthday, forKey: .birthday)
        
        try container.encode(gender.rawValue, forKey: .gender)
        
        try container.encode(interests, forKey: .interests)
    }
}


