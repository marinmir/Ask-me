//
//  InterestsView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class InterestsView: UIView {
    // MARK: - Properties
    let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
    private weak var vc: InterestsViewController?
    
    // MARK: - Public methods
    init(viewController vc: InterestsViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.allowsMultipleSelection = true
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
