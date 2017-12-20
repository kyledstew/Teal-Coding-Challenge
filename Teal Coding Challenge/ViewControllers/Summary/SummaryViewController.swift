//
//  SummaryViewController.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    var viewModel: SummaryViewModel!
    
    @IBAction func backToRankingsButtonSelected(_ sender: Any) {
        MainNavigationController.shared.popToRankings()
    }
    
    @IBOutlet weak var backToRankingsButton: UIButton!
    @IBOutlet weak var backToRankingsButtonSuperview: UIView!
    @IBOutlet weak var mainStackViewSuperview: UIView!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var averageTimePerProblemLabel: UILabel!
    @IBOutlet weak var numberOfIncorrectLabel: UILabel!
    @IBOutlet weak var numberOfCorrectLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelValues()
        setNavigationControllerAttributes()
        setAppearances()
    }
    
    func setNavigationControllerAttributes() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: false)
        self.title = "RESULTS"
    }
    
    func setAppearances() {
        backToRankingsButton.applyDefaultButtonAppearance()
        self.view.backgroundColor = Constants.mainColor
        backToRankingsButtonSuperview.backgroundColor = Constants.mainColor
        mainStackViewSuperview.backgroundColor = .white
        mainStackViewSuperview.layer.cornerRadius = 10
    }
    
    func setLabelValues() {
        totalTimeLabel.text = viewModel.getTotalTime + "s"
        averageTimePerProblemLabel.text = viewModel.getAverageTimePerQuestion + "s"
        numberOfIncorrectLabel.text = "\(viewModel.getNumberOfIncorrect)"
        numberOfCorrectLabel.text = "\(viewModel.getNumberOfCorrect)"
        scoreLabel.text = "\(viewModel.getScore)%"
        if let ranking = viewModel.getRanking {
            rankingLabel.text = "\(ranking)"
        } else {
            rankingLabel.text = "N/A"
        }
    }
    
}


