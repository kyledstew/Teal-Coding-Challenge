//
//  RoundViewController.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class RoundViewController: UIViewController {
    
    var viewModel = RoundViewModel()
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var selectionBox1Button: UIButton!
    @IBOutlet weak var selectionBox2Button: UIButton!
    @IBOutlet weak var selectionBox3Button: UIButton!
    @IBOutlet weak var selectionBox4Button: UIButton!
    @IBOutlet weak var selectionBox5Button: UIButton!
    @IBOutlet weak var selectionBox6Button: UIButton!
    
    @IBAction func didSelectBox1(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 1)
    }
    
    @IBAction func didSelectBox2(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 2)
    }
    
    @IBAction func didSelectBox3(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 3)
    }
    
    @IBAction func didSelectBox4(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 4)
    }
    
    @IBAction func didSelectBox5(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 5)
    }
    
    @IBAction func didSelectBox6(_ sender: UIButton) {
        viewModel.selectionSelected(selection: 6)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup(delegate: self)
        
        setNavigationControllerAttributes()
        setAppearances()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Constants.mainColor
    }
    
    func setNavigationControllerAttributes() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setAppearances() {
        questionLabel.backgroundColor = .clear
        questionLabel.textColor = .white
        
        for button in [selectionBox1Button, selectionBox2Button, selectionBox3Button, selectionBox4Button, selectionBox5Button, selectionBox6Button] {
            button?.setTitleColor(.black, for: .normal)
            button?.backgroundColor = .white
            button?.layer.cornerRadius = 15
            button?.addShadow(color: UIColor.white)
        }
    }
    
    func setNewQuestion() {
        questionLabel.text = viewModel.getQuestion()
        for (index, button) in [selectionBox1Button, selectionBox2Button, selectionBox3Button, selectionBox4Button, selectionBox5Button, selectionBox6Button].enumerated() {
            button?.setTitle("\(viewModel.getSelection(at: index))", for: .normal)
        }
    }
}

extension RoundViewController: RoundViewModelDelegate {
    func newQuestionAvailable() {
        setNewQuestion()
    }
    
    func completedRound() {
        for button in [selectionBox1Button, selectionBox2Button, selectionBox3Button, selectionBox4Button, selectionBox5Button, selectionBox6Button] {
            button?.isHidden = true
        }
        questionLabel.isHidden = true
        addActivityIndicator()
    }
    
    func addActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: self.view.bounds)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    func postedScore(_ error: NetworkError?) {
        if let error = error {
            AlertPresenter.networkError(error: error, presenter: self, completion: {
                MainNavigationController.shared.popToRankings()
            })
            return
        }
    }
}
