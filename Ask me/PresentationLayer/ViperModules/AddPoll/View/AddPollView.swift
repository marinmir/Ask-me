//
//  AddPollView.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 24.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddPollView: UIView {
    // MARK: - Properties
     private weak var vc: AddPollViewController?
     public let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    // MARK: - Public methods
    init(viewController vc: AddPollViewController) {
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
        tableView.delegate = vc
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc
       private func onBackgroundTap() -> Void {
           endEditing(true)
       }
}
