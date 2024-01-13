//
//  DessertDetail.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import Foundation

/// A struct reprsenting the Dessert Details
struct DessertDetails {
    let name: String
    let instructions: String
    let thumbnail: String
    let ingredients: [Ingredient]
    
    init() {
        self.name = ""
        self.instructions = ""
        self.thumbnail = ""
        self.ingredients = []
    }
    
    init(name: String, instructions: String, thumbnail: String, ingredients: [Ingredient]) {
        self.name = name
        self.instructions = instructions
        self.thumbnail = thumbnail
        self.ingredients = ingredients
    }
}

struct DessertData: Decodable {
    let meals: [[String: String?]]
}
