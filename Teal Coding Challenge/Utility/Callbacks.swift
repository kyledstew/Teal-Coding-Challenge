//
//  Callbacks.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

typealias RankingsCallback = ([Score], NetworkError?) -> ()
typealias BoolCallback = (Bool, NetworkError?) -> ()
typealias ErrorCallback = (NetworkError?) -> ()
typealias CurrentStandingCallback = (Int?, NetworkError?) -> ()
