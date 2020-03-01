//
//  InterestsViewController.swift
//  Ask me
//
//  Created by Мирошниченко Марина on 27.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {
    // MARK: - Properties
    var baseInterests: [String] = []
    var userInterests: [String] = []
    private var currentInterests: [String:Bool] = [:]
    
    private var profileVC: ProfileViewController
    private var _view: InterestsView {
        get {
            return view as! InterestsView
        }
    }
    
    // MARK: - Public methods
    init(profileVC vc: ProfileViewController) {
        profileVC = vc
        baseInterests = profileVC.getBaseInterests()
        userInterests = profileVC.getUserInterests()
        super.init(nibName: nil, bundle: nil)
        
        for interest in userInterests {
            currentInterests[interest] = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = InterestsView(viewController: self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneItem))
        navigationItem.title = "Interests"
    }
    
    @objc
    func onDoneItem() {
        profileVC.updateUserInterests(userInterests: Array(currentInterests.keys))
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private methods
    private func registerTableViewCells() -> Void {
        _view.tableView.register(InterestCells.self, forCellReuseIdentifier: InterestCells.identifier)
    }
}

// MARK: UITableViewDataSource
extension InterestsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseInterests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InterestCells(viewController: self)
        cell.textLabel?.text = baseInterests[indexPath.row]
        return cell
    }
}

// MARK: _ UITableViewDelegate
extension InterestsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.setSelected(shouldSelectInterestCell(at: indexPath.row), animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentInterests[baseInterests[indexPath.row]] = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        currentInterests[baseInterests[indexPath.row]] = nil
    }
    
    private func shouldSelectInterestCell(at index: Int) -> Bool {
        return currentInterests[baseInterests[index]] != nil
    }
}

