//
//  AddPollView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 24.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AddPollView: UIView {
    
    init(viewController vc: AddPollViewController) {
        _vc = vc
        
        super.init(frame: CGRect.zero)
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearance() {
        self.backgroundColor = Palette.almostWhite
        
        
    }
    
    private let _vc: AddPollViewController
}
