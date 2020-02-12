//
//  ProfileViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 25.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return AvatarCell()
        case 1:
                switch indexPath.row {
            case 0:
                let cell = StaticPersonalInfoCell()
                cell.setContent(name: "Phone number", value: presenter!.getUserPhoneNumber())
                return cell
            default:
                return UITableViewCell()
            }
        case 2:
            return UITableViewCell()
        case 3:
            let cell = SignOutCell()
            cell.setOnTapCallback(with: self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    
    override func loadView() {
        super.loadView()
        
        view = ProfileView(viewController: self)
    }
    
    var presenter: ProfilePresenter?
    
    @objc
    func onSignOutCellTap() {
        presenter?.onSignOutCell()
    }
    
    private func _registerTableViewCells() {
        _view.tableView.register(AvatarCell.self, forCellReuseIdentifier: AvatarCell.identifier)
        _view.tableView.register(StaticPersonalInfoCell.self, forCellReuseIdentifier: StaticPersonalInfoCell.identifier)
        _view.tableView.register(SignOutCell.self, forCellReuseIdentifier: SignOutCell.identifier)
    }
    
    private var _view: ProfileView {
        get {
            return view as! ProfileView
        }
    }
}
