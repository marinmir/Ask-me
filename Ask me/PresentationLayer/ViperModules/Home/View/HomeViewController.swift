//
//  ViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 16.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = HomeView(self)
    }

}

