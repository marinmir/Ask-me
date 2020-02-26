//
//  StaticPersonalInfoCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 11.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class StaticPersonalInfoCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "StaticPersonalInfoCell"
    
    private let nameLabel = UILabel(frame: CGRect.zero)
    private let valueLabel = UILabel(frame: CGRect.zero)
    
    //MARK: - Public methods
    init () {
        super.init(style: .default, reuseIdentifier: StaticPersonalInfoCell.identifier)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setContent(name: String, value: String) -> Void {
        nameLabel.text = name
        valueLabel.text = value
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void{
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        contentView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 44),
            
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            valueLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
