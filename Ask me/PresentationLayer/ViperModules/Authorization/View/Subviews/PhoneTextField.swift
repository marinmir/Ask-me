//
//  PhoneTextField.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 30.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import PhoneNumberKit

class PhoneTextField: PhoneNumberTextField {
    
    override var defaultRegion: String {
        get {
            return Locale.current.regionCode ?? "RU"
        }
        set {} // exists for backward compatibility
    }
}
