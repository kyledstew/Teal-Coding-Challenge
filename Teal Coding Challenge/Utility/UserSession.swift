//
//  UserSession.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/18/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class UserSession {
    
    static let shared = UserSession()
    
    fileprivate var gameHandleKey = "com.kylestewart.Teal-Coding-Challenge.gameHandleKey"
    var gameHandle: String? {
        get {
            return UserDefaults.standard.string(forKey: gameHandleKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: gameHandleKey)
        }
    }
    
}
