//
//  InterestCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 28.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class InterestCells: UITableViewCell {
    // MARK: - Properties
    static let identifier = "IterestCells"
    
    private var vc: InterestsViewController
    
    // MARK: - Public methods
    init (viewController vc: InterestsViewController) {
        self.vc = vc

        super.init(style: .default, reuseIdentifier: InterestCells.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            accessoryType = .checkmark
       }  else {
           accessoryType = .none
        }
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        //contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTap)))
        selectionStyle = .none
    }
    
//    @objc
//    private func onTap() {
//        vc.onInterestsCell()
//    }
}


