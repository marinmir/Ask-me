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
    var pollCases: [String] = []

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New question"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(onResetButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onNextButton))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @objc
    func onResetButton() {
        pollCases = []
        _view.tableView.reloadData()
    }
     @objc
    func onNextButton() {
        showAlert(message: "This is not implemented yet!")
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
    
    @objc
    func onAddAnswerCell() {
        if presenter!.canAddAnswer(currentCount: pollCases.count) {
            pollCases.append("")
            _view.tableView.reloadSections([1], with: .automatic)
            _view.tableView.scrollToRow(at: IndexPath(row: pollCases.count, section: 1), at: .bottom, animated: true)
        }
    }
    
    func onPollCaseChanged(newText text: String, atIndex index: Int) {
        pollCases[index] = text
    }
    
    // MARK: - Private methods
    private func registerTableViewCells() -> Void {
        _view.tableView.register(PollCell.self, forCellReuseIdentifier: PollCell.identifier)
        _view.tableView.register(AddAnswerCell.self, forCellReuseIdentifier: AddAnswerCell.identifier)
        _view.tableView.register(PossibleAnswerCell.self, forCellReuseIdentifier: PossibleAnswerCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension AddPollViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return pollCases.count + 1 // for addAnswerCell
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = PollCell(viewController: self)
            //cell.setContent(userImage: UIImage(), userNickname: user.nickname)
            return cell
        case 1:
            if indexPath.row == pollCases.count {
                let addAnswerCell = AddAnswerCell(viewController: self)
        
                return addAnswerCell
            } else {
                let possibleAnswerCell = PossibleAnswerCell(viewController: self)
                possibleAnswerCell.setContent(orderNumber: String(indexPath.row + 1), withText: pollCases[indexPath.row])
                return possibleAnswerCell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Question"
        case 1:
            return "Possible answers"
        default:
            return nil
        }
    }
}

// MARK: - UITableViewDelegate
extension AddPollViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        switch indexPath.section {
        case 1:
            if indexPath.row == pollCases.count {
                return .none
            } else {
                return .delete
            }
        default:
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pollCases.remove(at: indexPath.row)
            tableView.reloadSections([1], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
