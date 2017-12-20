//
//  GameHandleCheckError.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

enum GameHandleCheckError: Error {
    case notUnique
    
    var message: String {
        switch self {
        case .notUnique:
            return "Game Handle is not unique"
        }
    }
}
