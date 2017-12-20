//
//  NetworkRequest.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/20/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

class NetworkRequest {
    
    enum NetworkRequestResponse<T> {
        case success(T?)
        case failure(NetworkError)
    }
    
    static func request<T>(_ networkRequestData: NetworkRequestData<T>, callback: @escaping (NetworkRequestResponse<T>) -> ()) where T: Decodable {
        
        let request = buildRequest(networkRequestData)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                callback(.failure(NetworkError.networkError))
            }
            
            guard let data = data else {
                callback(.failure(NetworkError.noData))
                return
            }
            
            guard T.self != NoResponse.self else {
                callback(.success(nil))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let obj = try decoder.decode(networkRequestData.response, from: data)
                callback(.success(obj))
            } catch {
                callback(.failure(NetworkError.unableToParseJson))
            }
        }
        task.resume()
        
    }
    
    fileprivate static func buildRequest<T>(_ networkRequestData: NetworkRequestData<T>) -> URLRequest {
        
        var request = URLRequest(url: NetworkConstants.requestURL)
        
        switch networkRequestData.httpMethod {
        case .post(let body):
            request.httpBody = body.dataFromHttpBody
        default:
            break
        }
        
        request.httpMethod = networkRequestData.httpMethod.stringValue
        
        if let httpMethod = request.httpMethod, let url = request.url {
            print("Networking | \(httpMethod) \(url)")
        }
        
        return request
        
    }
}

fileprivate extension Dictionary {
    var dataFromHttpBody: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [])
    }
}
