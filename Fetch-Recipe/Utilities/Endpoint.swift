//
//  Endpoint.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

/// Represents different API endpoints such as meal lookup and filtering, providing URLs for each endpoint.
enum Endpoint {
    case lookup(id: String)
    case filter(mealType: String)
    
    var url: URL? {
        switch self {
        case .lookup(let id):
            return URL(string: Constants.baseURL + "lookup.php?i=\(id)")
            
        case .filter(let mealType):
            return URL(string: Constants.baseURL + "filter.php?c=\(mealType)")
        }
    }
}
