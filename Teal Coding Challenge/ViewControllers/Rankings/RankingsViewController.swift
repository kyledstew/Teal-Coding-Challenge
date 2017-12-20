//
//  RankingsViewController.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/18/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class RankingsViewController: UIViewController {

    var viewModel = RankingsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startARoundButton: UIButton!
    @IBOutlet weak var startARoundButtonSuperview: UIView!
    @IBAction func startARoundButtonSelected(_ sender: Any) {
        viewModel.didSelectStartARound()
    }
    
    override func viewDidLoad() {
        viewModel.delegate = self
        
        setNavigationControllerAttributes()
        setAppearances()
        setTableViewAttributes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func setNavigationControllerAttributes() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: false)
        self.title = "RANKINGS"
    }
    
    func setAppearances() {
        startARoundButton.applyDefaultButtonAppearance()
        self.view.backgroundColor = Constants.mainColor
        startARoundButtonSuperview.backgroundColor = Constants.mainColor.withAlphaComponent(0.5)
    }
    
    func setTableViewAttributes() {
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 10
    }
    
}

extension RankingsViewController: RankingsViewModelDelegate {

    func dataLoaded(error: NetworkError?) {
        if let error = error {
            AlertPresenter.networkError(error: error, presenter: self)
            return
        }
        
        tableView.reloadData()
    }
    
    func promptForGameHandle() {
        AlertPresenter.promptForGameHandle(presenter: self) { (gameHandle) in
            self.viewModel.checkGameHandle(gameHandle)
        }
    }
    
    func checkedGameHandle(error: GameHandleCheckError) {
        AlertPresenter.gameHandleError(error: error, presenter: self)
    }
    
}

extension RankingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfScores
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ScoreTableViewCell
        cell.populate(score: viewModel.score(at: indexPath.row))
        return cell
    }
}
