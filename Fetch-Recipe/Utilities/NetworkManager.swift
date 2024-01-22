//
//  NetworkManager.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/20/24.
//

import Foundation
import Combine

class NetworkManager {
    
    enum NetworkError: LocalizedError {
        case badURLResponse
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse: return "Bad Response from URL."
            case .unknown: return "Unknown Error occured"
            }
        }
    }
    
    //MARK: - Using COMBINE
    
    // 1. Create a Publisher.
    // 2. Subscribe Publisher on background thread.
    // 3. Recieve on main thread.
    // 4. Check that the data is good using tryMap
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {

        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .eraseToAnyPublisher()
    }
    
    static func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.badURLResponse
        }
        return output.data
    }
    
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            print("Recieved the data")
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Using URLSession DataTask
    static func downloadData(fromURL url: URL, completion: @escaping (_ data: Data?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data from server")
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
    
}
