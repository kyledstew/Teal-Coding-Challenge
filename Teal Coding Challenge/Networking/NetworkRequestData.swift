//
//  NetworkRequestData.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

struct NetworkRequestData<T> {
    var httpMethod: HTTPMethodType
    var response: T.Type
}
