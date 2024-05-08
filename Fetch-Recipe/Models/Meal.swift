//
//  Dessert.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

/// A struct representing a dessert with a unique identifier.
struct Meal: Identifiable, Codable {
    /// The unique identifier of the dessert.
    var id: String { idMeal }
    
    /// The name of the dessert.
    let strMeal: String
    
    /// The image of the dessert.
    let strMealThumb: String
    
    let idMeal: String
}

struct MealsListResponse: Codable {
    let meals: [Meal]
}
