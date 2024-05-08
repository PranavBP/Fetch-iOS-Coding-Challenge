//
//  ServiceManager.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/7/24.
//

import Foundation

/// Represents errors that can occur during service operations.
enum ServiceError: Error {
    case failedToFetch, failedToDecode
    
    /// Provides a user-friendly description of the error.
    var desc: String {
        switch self {
        case .failedToDecode:
            return "Failed to process or decode the retrieved data. Please try again later."
        case .failedToFetch:
            return "Failed to fetch data. Please check your internet connection and try again."
        }
    }
}

class ServiceManager {

    /// Singleton
    static let shared = ServiceManager()
    
    /// Private Initializer
    private init() {}
    
    /// Send API call
    /// - Parameters:
    ///   - request: URL to fetch data from
    ///   - type: The type of object we want
    ///   - completion: Callback with data and error
    public func execute<T: Decodable>(_ request: URL, expecting type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        
        NetworkManager.shared.downloadData(with: request) { resultData in
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
