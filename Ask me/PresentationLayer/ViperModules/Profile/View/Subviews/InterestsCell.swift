//
//  InterestsCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class InterestsCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "IterestsCell"
    
    private let interestsLabel = UILabel()
    private var vc: ProfileViewController
    
    // MARK: - Public methods
    init (viewController vc: ProfileViewController) {
        self.vc = vc

        super.init(style: .default, reuseIdentifier: InterestsCell.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTap)))
        
        interestsLabel.translatesAutoresizingMaskIntoConstraints = false
        interestsLabel.text = "Interests"
        interestsLabel.textAlignment = .left
        contentView.addSubview(interestsLabel)
        
        NSLayoutConstraint.activate([
            interestsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            interestsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            interestsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            interestsLabel.widthAnchor.constraint(equalToConstant: 100),
            interestsLabel.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc
    private func onTap() {
        vc.onInterestsCell()
    }
}

