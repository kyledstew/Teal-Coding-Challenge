//
//  QuestionGenerator.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class QuestionGenerator {
    
    static func getQuestion() -> Question {
        let firstOperand = randomNumber
        let secondOperand = randomNumber
        let selections = getSelections(firstOperand: firstOperand, secondOperand: secondOperand)
        
        let question = Question(
            firstOperand: firstOperand,
            secondOperand: secondOperand,
            selections: selections.shuffled()
        )
        
        assert(question.selections.count == 6)
        return question
    }
    
    fileprivate static func getSelections(firstOperand: Int, secondOperand: Int) -> [Int] {
        var selections: [Int] = []
        
        // make sure the correct answer only appears once
        repeat {
            selections = [
                firstOperand * secondOperand,
                randomAnswer,
                randomAnswer,
                randomAnswer,
                randomAnswer,
                randomAnswer
            ]
        } while selections.filter({ $0 == firstOperand * secondOperand }).count > 1
        
        return selections
    }
    
    // returns a random answer
    fileprivate static var randomAnswer: Int {
        return randomNumber * randomNumber
    }
    
    // returns a random number between 10 and 99
    fileprivate static var randomNumber: Int {
        let randomNum: UInt32 = arc4random_uniform(89)
        return Int(randomNum + 10)
    }
}

fileprivate extension Array {
    func shuffled() -> Array {
        var shuffled = self
        guard count > 1 else {
            return self
        }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: count, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            shuffled.swapAt(firstUnshuffled, i)
        }
        
        return shuffled
    }
}
