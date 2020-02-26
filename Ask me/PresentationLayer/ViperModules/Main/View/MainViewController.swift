//
//  MainViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 17.01.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    // MARK: - Properties
    var presenter: MainPresenter?
    
    private let homeTabController = HomeViewController()
    private let searchTabController = SearchViewController()
    private let addPollTabController = AddPollRouter.createModule()
    private let notificationTabController = NotificationsViewController()
    private let profileTabController = ProfileRouter.createModule()
    
    // MARK: - Public methods
    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        presenter?.onViewWillAppear()
        createTabs()
        
        viewControllers = [homeTabController, searchTabController, addPollTabController, notificationTabController, profileTabController]
    }
    
    // MARK: - Private methods
    private func createTabs() -> Void {
        createHomeTab()
        
        createSearchTab()
        
        createAddPollTab()
        
        createNotificationTab()
        
        createProfileTab()
    }
    
    private func createHomeTab() -> Void {
        homeTabController.title = "Home"
        
        let homeTabItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        // Move the tabbar icon to the middle of tabbar
        homeTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0);
        
        homeTabController.tabBarItem = homeTabItem
    }
    
    private func createSearchTab() -> Void {
        searchTabController.title = "Search"
        
        let searchTabItem = UITabBarItem(title: nil, image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        
        // Move the tabbar icon to the middle of tabbar
        searchTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        searchTabController.tabBarItem = searchTabItem
    }
    
    private func createAddPollTab() -> Void {
        addPollTabController.title = "Add poll"
        
        let addPollTabItem = UITabBarItem(title: nil, image: UIImage(named: "add"), selectedImage: UIImage(named: "add"))
        
        // Move the tabbar icon to the middle of tabbar
        addPollTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        addPollTabController.tabBarItem = addPollTabItem
    }
    
    private func createNotificationTab() -> Void {
        notificationTabController.title = "Notifications"
        
        let notificationTabItem = UITabBarItem(title: nil, image: UIImage(named: "notifications"), selectedImage: UIImage(named: "notifications"))
        
        //Move the tabbar icon to the middle of tabbar
        notificationTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        notificationTabController.tabBarItem = notificationTabItem
    }
    
    private func createProfileTab() -> Void {
        profileTabController.title = "Profile"
        
        let profileTabItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        
        //Move tabbar icon to the middle of tabbar
        profileTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        profileTabController.tabBarItem = profileTabItem
    }
}

// MARK: - UITabBarControllerDelegate
extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) -> Void {
        print("Selected \(viewController.title!)")
    }
}
