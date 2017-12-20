//
//  Question.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

struct Question {
    var firstOperand: Int
    var secondOperand: Int
    var selections: [Int]
    var answer: Int {
        return firstOperand * secondOperand
    }
}
