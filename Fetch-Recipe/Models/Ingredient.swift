//
//  Ingredient.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

/// A struct representing an ingredient
struct Ingredient: Identifiable, Decodable {
    var id: String = UUID().uuidString
    /// Name of the ingredient
    let name: String
    /// Quantity or measure of ingredient
    let measure: String
}
