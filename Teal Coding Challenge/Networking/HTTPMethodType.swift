//
//  HTTPMethodType.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

enum HTTPMethodType {
    case get
    case post(body: [String: AnyObject])
    
    var stringValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
