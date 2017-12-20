//
//  SummaryViewModel.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class SummaryViewModel {
    
    fileprivate var data: RoundSummary
    
    init(data: RoundSummary) {
        self.data = data
    }
    
    var getTotalTime: String {
        return data.totalTime.roundedString
    }
    
    var getAverageTimePerQuestion: String {
        return data.averageTimePerQuestion.roundedString
    }
    
    var getNumberOfIncorrect: Int {
        return data.numberOfIncorrect
    }
    
    var getNumberOfCorrect: Int {
        return data.numberOfCorrect
    }
    
    var getScore: Int {
        return data.score
    }
    
    var getRanking: Int? {
        return data.ranking
    }
    
}

fileprivate extension Double {
    var roundedString: String {
        return String(format: "%.2f", self)
    }
}
