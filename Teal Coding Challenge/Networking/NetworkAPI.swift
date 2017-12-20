//
//  NetworkAPI.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/18/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class NetworkAPI {
    
    static func getRankings(callback: @escaping RankingsCallback) {
        let networkRequestData = NetworkRequestData(httpMethod: .get, response: [Score].self)
        NetworkRequest.request(networkRequestData) { (response) in
            switch response {
            case .success(let data):
                callback(data!, nil)
            case .failure(let error):
                callback([], error)
            }
        }
    }
    
    static func postScore(_ score: Score, callback: @escaping ErrorCallback) {
        let networkRequestData = NetworkRequestData(httpMethod: .post(body: score.httpBody), response: NoResponse.self)
        NetworkRequest.request(networkRequestData) { (response) in
            switch response {
            case .success:
                callback(nil)
            case .failure(let error):
                callback(error)
            }
        }
    }

}
