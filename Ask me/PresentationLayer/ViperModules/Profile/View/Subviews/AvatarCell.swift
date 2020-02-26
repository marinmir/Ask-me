//
//  AvatarCell.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 07.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AvatarCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "AvatarCell"
    
    private var userAvatar = UIImage(named: "user")
    private var userAvatarView: UIImageView?
    private let nicknameTextField = UITextField(frame: CGRect.zero)
    private var vc: ProfileViewController
    
    // MARK: - Public methods
    init (viewController vc: ProfileViewController) {
        self.vc = vc
        userAvatarView = UIImageView(image: userAvatar)
        
        super.init(style: .default, reuseIdentifier: AvatarCell.identifier)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(userImage image: UIImage, userNickname nickname: String) -> Void {
        userAvatar = image
        nicknameTextField.text = nickname
    }
    
    // MARK: - Private methods
    private func setAppearance() -> Void {
        guard let userAvatarView = userAvatarView else {
            return
        }
        userAvatarView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userAvatarView)
        
        nicknameTextField.translatesAutoresizingMaskIntoConstraints = false
        nicknameTextField.placeholder = "Nickname"
        nicknameTextField.textContentType = .nickname
        nicknameTextField.layer.cornerRadius = 5
        nicknameTextField.borderStyle = .roundedRect
        nicknameTextField.layer.borderWidth = 1
        nicknameTextField.layer.borderColor = Palette.darkCoffeeColor.cgColor
        nicknameTextField.textColor = Palette.darkCoffeeColor
        nicknameTextField.delegate = self
        nicknameTextField.autocapitalizationType = .words
        contentView.addSubview(nicknameTextField)
        
        NSLayoutConstraint.activate([
            userAvatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userAvatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            userAvatarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            userAvatarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            userAvatarView.widthAnchor.constraint(equalToConstant: 80),
            userAvatarView.heightAnchor.constraint(equalToConstant: 80),
            
            nicknameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nicknameTextField.leadingAnchor.constraint(equalTo: userAvatarView.trailingAnchor, constant: 7),
            nicknameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

//MARK: - UITextFieldDelegate
extension AvatarCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) -> Void {
        vc.onNicknameEditingFinished(with: nicknameTextField.text ?? " ")
    }
}
