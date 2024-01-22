//
//  DessertDetail.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import Foundation

struct MealsResponse: Decodable {
    let meals: [Meals]?
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}


struct Meals: Decodable, Identifiable {
    var id: String {idMeal}
    let idMeal: String
    let strMeal: String?
    let strInstructions: String?
    let strMealThumb: String?
    let ingredients: [Ingredient]?
}


/**
 Custom Decoder
 1. To Decode Values - id, name, instructions and ingredients array
 2. To Exclude nil values
 */
extension Meals {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        
        var index = 1
        var ingredientsList: [Ingredient] = []
        
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredientsList.append(Ingredient(name: ingredient, measure: measure))
            index += 1
        }
        
        ingredients = ingredientsList
        idMeal = mealDict["idMeal"] as? String ?? ""
        strMeal = mealDict["strMeal"] as? String ?? ""
        strInstructions = Meals.formatInstructionString(mealDict["strInstructions"] as? String ?? "")
        strMealThumb = mealDict["strMealThumb"] as? String ?? ""
    }
    
    
    static private func formatInstructionString(_ str: String) -> String {
        var formattedString = ""
        
        let lines = str.components(separatedBy: "\r\n") // Split the input string
        var index = 1
        
        for line in lines {
            if !line.isEmpty {
                formattedString.append("\(index). \(line)\n\r") // Add numeric points and a new line
                index += 1
            }
        }
        return formattedString
    }
    
}


