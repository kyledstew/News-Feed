//
//  Networking.swift
//  Nike Code Challenge
//
//  Created by Kyle Stewart on 12/9/18.
//  Copyright © 2018 Kyle Stewart. All rights reserved.
//

import Foundation

class Networking {
    
    enum Result<T> {
        case success(T)
        case failure(Error?)
    }
    
    enum NetworkError: Error {
        case noData
        case errorParsingData
    }
    
    static var headlinesURL: URL? {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=" + NetworkConstants.apiKey)
    }

    static func getHeadlines(callback: @escaping (Result<[Article]>) -> Void) {
        guard let headlinesURL = headlinesURL else {
            print("Error - headlinesURL is nil")
            return
        }
        
        let request = URLRequest(url: headlinesURL)
        let downloadTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("ERROR - \(error)")
                callback(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Error - no error, and no data")
                callback(.failure(NetworkError.noData))
                return
            }
            
            guard let getHeadlinesResponse = parseGetHeadlinesResponse(data: data) else {
                callback(.failure(NetworkError.errorParsingData))
                return
            }
            
            callback(.success(getHeadlinesResponse.articles))
            
        }
        downloadTask.resume()
    }
    
    internal static func parseGetHeadlinesResponse(data: Data) -> GetHeadlinesResponse? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let getHeadlinesResponse = try jsonDecoder.decode(GetHeadlinesResponse.self, from: data)
            guard getHeadlinesResponse.status == "ok" else {
                print("Error - status not \"ok\"")
                return nil
            }
            return getHeadlinesResponse
        } catch {
            print("Error - unable to parse data: \(error)")
            return nil
        }
    }
    
}
