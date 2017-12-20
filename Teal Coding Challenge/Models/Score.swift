//
//  Score.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

struct Score: Codable {
    var userid: String
    var score: Int
    var mtime: Double
    var qtime: Double
    
    var matchTimeQuestionTimeLabelText: String {
        return "Match Time: \(mtime)s  |  Question Time: \(qtime)s"
    }
    
    var httpBody: [String: AnyObject] {
        return [
            "userid" : userid as AnyObject,
            "score" : "\(score)" as AnyObject,
            "mtime" : "\(mtime)" as AnyObject,
            "qtime" : "\(qtime)" as AnyObject
        ]
    }
}
