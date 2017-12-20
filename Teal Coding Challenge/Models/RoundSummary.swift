//
//  RoundSummary.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

struct RoundSummary {
    var totalTime: Double
    var averageTimePerQuestion: Double
    var numberOfIncorrect: Int
    var numberOfCorrect: Int
    var score: Int
    var ranking: Int?
    
    init(answeredQuestions: [AnsweredQuestion], totalTime: Double, ranking: Int?) {
        self.totalTime = totalTime.rounded(toPlaces: 2)
        self.averageTimePerQuestion = answeredQuestions.getAverageTimePerQuestion.rounded(toPlaces: 2)
        self.numberOfIncorrect = answeredQuestions.numberOfIncorrect
        self.numberOfCorrect = answeredQuestions.numberOfCorrect
        self.score = answeredQuestions.score
        self.ranking = ranking
    }
    
}

fileprivate extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

fileprivate extension Array where Element == AnsweredQuestion {
    
    var getAverageTimePerQuestion:  Double {
        let sum = self.map({ $0.timeToAnswer }).reduce(0, +)
        return (sum / Double(self.count))
    }
    
    var numberOfIncorrect: Int {
        return self.filter({ !$0.isCorrect }).count
    }
    
    var numberOfCorrect: Int {
        return self.filter({ $0.isCorrect }).count
    }
    
    var score: Int {
        return Int(Double(numberOfCorrect) / Double(20) * 100)
    }
    
}
