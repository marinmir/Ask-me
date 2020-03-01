//
//  PollCelll.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 01.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class PollCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "PollCell"
    
    private var vc: AddPollViewController
    private let pollTextField = UITextField(frame: CGRect.zero)
    
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
        pollTextField.translatesAutoresizingMaskIntoConstraints = false
        pollTextField.placeholder = "Enter your question here"
        contentView.addSubview(pollTextField)
        
        NSLayoutConstraint.activate([
           pollTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
           pollTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           pollTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
           pollTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
           pollTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
