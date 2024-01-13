//
//  Dessert.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/11/24.
//

import Foundation

/// A struct representing a dessert with a unique identifier.
struct Dessert: Identifiable, Codable {
    /// The unique identifier of the dessert.
    var id: String { idMeal }
    
    /// The name of the dessert.
    let strMeal: String
    
    /// The image of the dessert.
    let strMealThumb: String
    
    let idMeal: String
}

struct DessertListResponse: Codable {
    let meals: [Dessert]
}
