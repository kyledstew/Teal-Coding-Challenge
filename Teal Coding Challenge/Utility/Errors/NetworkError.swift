//
//  NetworkError.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case noData
    case unableToParseJson
    
    var message: String {
        switch self {
        case .networkError:
            return "Unable to connect with server"
        case .noData:
            return "No Data returned from server"
        case .unableToParseJson:
            return "Unable to get data from server"
        }
    }
}
