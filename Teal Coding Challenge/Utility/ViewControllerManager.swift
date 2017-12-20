//
//  ViewControllerManager.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/18/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

enum ViewControllers {
    case rankings
    case round
    case summary(data: RoundSummary)
    
    var storyboardID: String {
        switch self {
        case .rankings:
            return "RankingsViewController"
        case .round:
            return "RoundViewController"
        case .summary:
            return "SummaryViewController"
        }
    }
    
    var getInstance: UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: self.storyboardID)
    }
}
