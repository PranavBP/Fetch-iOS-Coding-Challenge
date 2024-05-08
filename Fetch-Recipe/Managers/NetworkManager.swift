//
//  NetworkManager.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

class NetworkManager {
    
    typealias downloadDataCompletion = (Data?) -> ()
    
    /// Private init
    private init() {}
    
    /// Singleton
    static let shared = NetworkManager()
    
    //MARK: - Using URLSession DataTask
    
    /// Download data from the internet
    /// - Parameters:
    ///   - url: URL to download data from.
    ///   - completion: Callback with optional Data.
    public func downloadData(with url: URL, completion: @escaping downloadDataCompletion) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
}
