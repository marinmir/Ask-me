//
//  AddPollView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 24.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddPollView: UIView {
    // MARK: - Properties
     private weak var vc: AddPollViewController?
    
    // MARK: - Public methods
    init(viewController vc: AddPollViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        self.backgroundColor = Palette.almostWhite
    }
}
