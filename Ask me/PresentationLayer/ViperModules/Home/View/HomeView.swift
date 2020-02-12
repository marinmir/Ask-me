//
//  MainView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    init(_ vc: HomeViewController?) {
        super.init(frame: CGRect.zero)
        self._vc = vc
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearance() {
        
        self.backgroundColor = UIColor.white
        
        
        NSLayoutConstraint.activate(
            [
        ])
    }
    
    
    private weak var _vc: HomeViewController?
    
}
