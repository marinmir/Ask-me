//
//  AddPollViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 24.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class AddPollViewController: UIViewController {
    override func loadView() {
        super.loadView()
        
        view = AddPollView(viewController: self)
    }
    
    var presenter: AddPollPresenter?
    
    private var _view: AddPollView {
        get {
            return view as! AddPollView
        }
    }
}
