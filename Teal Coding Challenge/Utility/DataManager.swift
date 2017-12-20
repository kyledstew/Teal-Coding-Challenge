//
//  DataManager.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class DataManager {
    
    static func checkIfUnique(gameHandle: String, callback: @escaping BoolCallback) {
        NetworkAPI.getRankings { (scores, error) in
            if let error = error {
                callback(false, error)
                return
            }
            
            if scores.contains(where: { $0.userid == gameHandle }) {
                callback(false, nil)
                return
            }
            
            callback(true, nil)
        }
    }
    
    static func getRankings(callback: @escaping RankingsCallback) {
        NetworkAPI.getRankings(callback: callback)
    }
    
    static func postScore(_ score: Score, callback: @escaping CurrentStandingCallback) {
        NetworkAPI.postScore(score) { (error) in
            if let error = error {
                callback(nil, error)
                return
            }
            
            DataManager.getRankings(callback: { (scores, error) in
                if let error = error {
                    callback(nil, error)
                    return
                }
                
                if let ranking: Int = scores.index(where: { $0.userid == score.userid }) {
                    callback(ranking + 1, nil)
                } else {
                    // if our game handle doesn't appear, then we didn't rank in the top 100.
                    callback(nil, nil)
                }
            })
            
        }
    }
    
}
