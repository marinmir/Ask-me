//
//  AvatarCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AvatarCell: UITableViewCell {
    static let identifier = "AvatarCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier ?? AvatarCell.identifier)
        
        _userAvatarView = UIImageView(image: _userAvatar)
        
        _setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNewUserAvatar(new image: UIImage) {
        _userAvatar = image
    }
    
    func getUserAvatar() -> UIImage {
        return _userAvatar ?? UIImage(named: "user")!
    }
    
    private func _setAppearance() {
        
        guard let userAvatarView = _userAvatarView
            else {
                return
            }
        userAvatarView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userAvatarView)
        
        _nicknameTextField.translatesAutoresizingMaskIntoConstraints = false
        _nicknameTextField.placeholder = "Nickname"
        _nicknameTextField.textContentType = .nickname
        _nicknameTextField.layer.cornerRadius = 5
        _nicknameTextField.borderStyle = .roundedRect
        _nicknameTextField.layer.borderWidth = 1
        _nicknameTextField.layer.borderColor = Palette.darkCoffeeColor.cgColor
        _nicknameTextField.textColor = Palette.darkCoffeeColor
        _nicknameTextField.autocapitalizationType = .words
        contentView.addSubview(_nicknameTextField)
        
        NSLayoutConstraint.activate([
            userAvatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userAvatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            userAvatarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            userAvatarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            userAvatarView.widthAnchor.constraint(equalToConstant: 80),
            userAvatarView.heightAnchor.constraint(equalToConstant: 80),
            
            _nicknameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            _nicknameTextField.leadingAnchor.constraint(equalTo: userAvatarView.trailingAnchor, constant: 7),
            _nicknameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            _nicknameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private var _userAvatar = UIImage(named: "user")
    private var _userAvatarView: UIImageView?
    private let _nicknameTextField = UITextField(frame: CGRect.zero)
}
