//
//  SignOutCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 12.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class SignOutCell: UITableViewCell {
    static let identifier = "SignOutCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier ?? StaticPersonalInfoCell.identifier)
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    func setOnTapCallback(with viewController: ProfileViewController) {
        _signOutBtn.addTarget(viewController, action: #selector(viewController.onSignOutCellTap), for: .touchUpInside)
    }
    
    private func _setAppearance() {
        _signOutBtn.translatesAutoresizingMaskIntoConstraints = false
        _signOutBtn.setTitle("Exit", for: .normal)
        _signOutBtn.setTitleColor(.black, for: .normal)
        _signOutBtn.contentHorizontalAlignment = .left
        
        contentView.addSubview(_signOutBtn)
        
        NSLayoutConstraint.activate([
            _signOutBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            _signOutBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            _signOutBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            _signOutBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            _signOutBtn.heightAnchor.constraint(equalToConstant: 44),
            _signOutBtn.widthAnchor.constraint(equalToConstant: 152)
        ])
    }
    
    private let _signOutBtn = UIButton(frame: CGRect.zero)
}
