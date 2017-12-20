//
//  ScoreTableViewCell.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var gameHandleLabel: UILabel!
    @IBOutlet weak var matchTimeQuestionTimeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func populate(score: Score) {
        gameHandleLabel.text = score.userid
        matchTimeQuestionTimeLabel.text = score.matchTimeQuestionTimeLabelText
        scoreLabel.text = "\(score.score)"

        setAppearances()
    }
    
    func setAppearances() {
        
        let cellBackgroundColor: UIColor
        let textColor: UIColor
        
        if gameHandleLabel.text == UserSession.shared.gameHandle {
            cellBackgroundColor = .red
            textColor = .white
        } else {
            cellBackgroundColor = .white
            textColor = .black
        }
        
        backgroundColor = cellBackgroundColor
        for label in [gameHandleLabel, matchTimeQuestionTimeLabel, scoreLabel] {
            label?.textColor = textColor
        }
    }

}
