//
//  StaticPersonalInfoCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 11.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class StaticPersonalInfoCell: UITableViewCell {
    static let identifier = "StaticPersonalInfoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier ?? StaticPersonalInfoCell.identifier)
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setContent(name: String, value: String) {
        _nameLbl.text = name
        _valueLbl.text = value
    }
    
    private func _setAppearance() {
        _nameLbl.translatesAutoresizingMaskIntoConstraints = false
        _nameLbl.textAlignment = .left
        contentView.addSubview(_nameLbl)
        
        _valueLbl.translatesAutoresizingMaskIntoConstraints = false
        _valueLbl.textAlignment = .right
        contentView.addSubview(_valueLbl)
        
        NSLayoutConstraint.activate([
            _nameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            _nameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            _nameLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            _nameLbl.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -4),
            _nameLbl.heightAnchor.constraint(equalToConstant: 44),
            
            _valueLbl.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 4),
            _valueLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            _valueLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            _valueLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            _valueLbl.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
        
    private let _nameLbl = UILabel(frame: CGRect.zero)
    private let _valueLbl = UILabel(frame: CGRect.zero)
}
