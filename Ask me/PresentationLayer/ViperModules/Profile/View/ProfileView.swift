//
//  ProfileView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 25.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    // MARK: - Properties
    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    
    private weak var vc: ProfileViewController?
    
    // MARK: - Public methods
    init(viewController vc: ProfileViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        backgroundColor = Palette.almostWhite
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap)))
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = vc
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(vc!.tabBarController?.tabBar.frame.height ?? 0))
        ])
    }
    
    @objc
    private func onBackgroundTap() -> Void {
        endEditing(true)
    }
}
