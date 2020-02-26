//
//  AddPollViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 24.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class AddPollViewController: UIViewController {
    // MARK: - Properties
    var presenter: AddPollPresenter?
    
    private var _view: AddPollView {
        get {
            return view as! AddPollView
        }
    }
    
    // MARK: - Public methods
    override func loadView() -> Void {
        super.loadView()
        
        view = AddPollView(viewController: self)
    }
}
