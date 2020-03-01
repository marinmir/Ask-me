//
//  AddPollPresenter.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class AddPollPresenter {
    // MARK: - Properties
    var interactor: AddPollInteractor?
    var router: AddPollRouter?
    var viewController: AddPollViewController?
    
    public let maxAnswers = 10
    
    // MARK: - Public methods
    func canAddAnswer(currentCount count: Int) -> Bool {
        if count >= maxAnswers {
            viewController?.showAlert(message: "You can add maximum \(maxAnswers) answers")
            return false
        } else {
            return true
        }
    }
}
