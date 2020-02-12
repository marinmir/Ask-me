//
//  ProfileView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 25.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    public let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    
    init(viewController vc: ProfileViewController) {
        _vc = vc
        
        super.init(frame: CGRect.zero)
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _setAppearance() {
        self.backgroundColor = Palette.backgroundColor
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = _vc
        tableView.delegate = _vc
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(_vc.tabBarController?.tabBar.frame.height ?? 0))
        ])
    }
    
    private let _vc: ProfileViewController
}
