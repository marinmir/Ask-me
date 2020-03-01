//
//  PossibleAnswerCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 01.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class PossibleAnswerCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "PossibleAnswerCell"
    
    private var vc: AddPollViewController
    private let possibleAnswerTextField = UITextField()
    private let countLabel = UILabel()
    
    // MARK: - Public methods
    init (viewController vc: AddPollViewController) {
        self.vc = vc

        super.init(style: .default, reuseIdentifier: InterestCells.identifier)
        
        setAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContetnt(orderNumber number: String) {
        countLabel.text = number
    }

    // MARK: - Private methods
    private func setAppearance() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(countLabel)
        
         possibleAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
         possibleAnswerTextField.placeholder = "Enter your variant of answer"
         contentView.addSubview(possibleAnswerTextField)
         
         NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            countLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            countLabel.heightAnchor.constraint(equalToConstant: 44),
            countLabel.widthAnchor.constraint(equalToConstant: 44),
            
            possibleAnswerTextField.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 4),
            possibleAnswerTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            possibleAnswerTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            possibleAnswerTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            possibleAnswerTextField.heightAnchor.constraint(equalToConstant: 44),
         ])
    }
}
