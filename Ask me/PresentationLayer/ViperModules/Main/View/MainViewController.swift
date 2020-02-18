//
//  MainViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {
     var presenter: MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _createTabs()
        
        self.viewControllers = [_homeTabController, _searchTabController, _addPollTabController, _notificationTabController, _profileTabController]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
    private func _createTabs() {
        _createHomeTab()
        
        _createSearchTab()
        
        _createAddPollTab()
        
        _createNotificationTab()
        
        _createProfileTab()
    }
    
    private func _createHomeTab() {
        // Create Home Tab
        _homeTabController.title = "Home"
        
        let homeTabItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        // Move the tabbar icon to the middle of tabbar
        homeTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0);
        
        _homeTabController.tabBarItem = homeTabItem
    }
    
    private func _createSearchTab(){
        //Create Search Tab
        _searchTabController.title = "Search"
        
        let searchTabItem = UITabBarItem(title: nil, image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        
        // Move the tabbar icon to the middle of tabbar
        searchTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        _searchTabController.tabBarItem = searchTabItem
    }
    
    private func _createAddPollTab() {
        //Create AddPoll Tab
        _addPollTabController.title = "Add poll"
        
        let addPollTabItem = UITabBarItem(title: nil, image: UIImage(named: "add"), selectedImage: UIImage(named: "add"))
        
        // Move the tabbar icon to the middle of tabbar
        addPollTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        _addPollTabController.tabBarItem = addPollTabItem
    }
    
    private func _createNotificationTab() {
        //Create Notification Tab
        _notificationTabController.title = "Notifications"
        
        let notificationTabItem = UITabBarItem(title: nil, image: UIImage(named: "notifications"), selectedImage: UIImage(named: "notifications"))
        
        //Move the tabbar icon to the middle of tabbar
        notificationTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        _notificationTabController.tabBarItem = notificationTabItem
    }
    
    private func _createProfileTab() {
        //Create Profile Tab
        _profileTabController.title = "Profile"
        
        let profileTabItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        
        //Move tabbar icon to the middle of tabbar
        profileTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        _profileTabController.tabBarItem = profileTabItem
    }
    
    private let _homeTabController = HomeViewController()
    private let _searchTabController = SearchViewController()
    private let _addPollTabController = AddPollRouter.createModule()
    private let _notificationTabController = NotificationsViewController()
    private let _profileTabController = ProfileRouter.createModule()
}
