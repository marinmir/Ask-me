//
//  ProfileViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 25.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    var presenter: ProfilePresenter?
    
    private var user: User?
    private var _view: ProfileView {
        get {
            return view as! ProfileView
        }
    }
    
    // MARK: - Public methods
    override func loadView() {
        super.loadView()
        
        view = ProfileView(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(true)
        
        user = presenter?.getUser()
    }
    
    func onBirthdayEditingFinished(with birthday: Date) -> Void {
        presenter?.onNewBirthday(with: birthday)
    }
    
    func onNicknameEditingFinished(with text: String) -> Void {
        presenter?.onNewNickname(with: text)
    }
    
    func onGenderEditingFinished(with gender: Gender) -> Void {
        presenter?.onNewGender(with: gender)
    }
    
    @objc
    func onSignOutCellTap() -> Void {
        presenter?.onSignOutCell()
    }
    
    // MARK: - Private methods
    private func registerTableViewCells() -> Void {
        _view.tableView.register(AvatarCell.self, forCellReuseIdentifier: AvatarCell.identifier)
        _view.tableView.register(StaticPersonalInfoCell.self, forCellReuseIdentifier: StaticPersonalInfoCell.identifier)
        _view.tableView.register(SignOutCell.self, forCellReuseIdentifier: SignOutCell.identifier)
        _view.tableView.register(BirthdayCell.self, forCellReuseIdentifier: BirthdayCell.identifier)
        _view.tableView.register(GenderCell.self, forCellReuseIdentifier: GenderCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // avatar cell
        case 1:
            return 3 // phone, birthday, gender cells
        case 2:
            return 1 // interests cell
        case 3:
            return 1 // sign out cell
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = self.user else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            let cell = AvatarCell(viewController: self)
            cell.setContent(userImage: UIImage(), userNickname: user.nickname)
            return cell
        case 1:
            switch indexPath.row {
                case 0:
                    let cell = StaticPersonalInfoCell()
                    cell.setContent(name: "Phone ", value: presenter!.getUserPhoneNumber())
                    return cell
                case 1:
                    let cell = BirthdayCell(viewController: self)
                    cell.setContent(userBirthday: user.birthday)
                    return cell
                case 2:
                    let cell = GenderCell(viewController: self)
                    cell.setContent(userGender: user.gender )
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
}
