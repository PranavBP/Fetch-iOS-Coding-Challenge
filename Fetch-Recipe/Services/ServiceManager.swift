//
//  ServiceManager.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 2/12/24.
//

import Foundation

class ServiceManager {
    
    enum ServiceError: Error {
        case failedToFetch, failedToDecode
        
        var desc: String {
            switch self {
            case .failedToDecode:
                return "Failed to Decode"
            case .failedToFetch:
                return "Failed to fetch"
            }
        }
    }
    
    /// Singleton
    static let shared = ServiceManager()
    
    /// Private Initializer
    private init() {}
    
    /// Send API call
    /// - Parameters:
    ///   - request: URL to fetch data from
    ///   - type: The type of object we want
    ///   - completion: Callback with data and error
    public func execute<T: Codable>(_ request: URL, expecting type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        
        NetworkManager.downloadData(fromURL: request) { resultData in
            if let data = resultData {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(.success(result))
                } catch {
                    completion(.failure(ServiceError.failedToDecode))
                }
            } else {
                completion(.failure(ServiceError.failedToFetch))
            }
        }
    }
}
