//
//  MainView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class HomeView: UIView {
    // MARK: - Properties
    private weak var vc: HomeViewController?
    
    // MARK: - Public methods
    init(_ vc: HomeViewController?) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        self.backgroundColor = UIColor.white
        
        NSLayoutConstraint.activate(
            [
        ])
    }
}
