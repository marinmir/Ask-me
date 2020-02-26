//
//  SignOutCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 12.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class SignOutCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "SignOutCell"
    
    private let signOutButton = UIButton(frame: CGRect.zero)
    
    //MARK: - Public methods
    init () {
        super.init(style: .default, reuseIdentifier: SignOutCell.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    func setOnTapCallback(with viewController: ProfileViewController) -> Void {
        signOutButton.addTarget(viewController, action: #selector(viewController.onSignOutCellTap), for: .touchUpInside)
    }
    
    //MARK: - Private mothods
    private func setAppearance() -> Void {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.setTitle("Exit", for: .normal)
        signOutButton.setTitleColor(.black, for: .normal)
        signOutButton.contentHorizontalAlignment = .left
        contentView.addSubview(signOutButton)
        
        NSLayoutConstraint.activate([
            signOutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            signOutButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            signOutButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            signOutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            signOutButton.heightAnchor.constraint(equalToConstant: 44),
            signOutButton.widthAnchor.constraint(equalToConstant: 152)
        ])
    }
}
