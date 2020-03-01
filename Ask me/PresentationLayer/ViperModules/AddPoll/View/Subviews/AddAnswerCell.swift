//
//  AddAnswerCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 01.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddAnswerCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "AddAnswerCell"
    
    private var vc: AddPollViewController
    private let addLabel = UILabel()
    private let plusImage = UIImageView(image: UIImage(named: "add"))
    
    // MARK: - Public methods
    init (viewController vc: AddPollViewController) {
        self.vc = vc

        super.init(style: .default, reuseIdentifier: InterestCells.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setAppearance() {
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: vc, action: #selector(vc.onAddAnswerCell)))
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.text = "Add new answer"
        contentView.addSubview(addLabel)
        
        plusImage.translatesAutoresizingMaskIntoConstraints = false
        plusImage.tintColor = UIColor.systemBlue
        contentView.addSubview(plusImage)
        
        NSLayoutConstraint.activate([
            plusImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            plusImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            plusImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            plusImage.widthAnchor.constraint(equalToConstant: 44),
            plusImage.heightAnchor.constraint(equalToConstant: 44),
            
            addLabel.leadingAnchor.constraint(equalTo: plusImage.trailingAnchor, constant: 4),
            addLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            addLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            addLabel.widthAnchor.constraint(equalToConstant: 200),
            addLabel.heightAnchor.constraint(equalToConstant: 44),
        ])
        
    }
}
