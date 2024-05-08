//
//  DessertDetail.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

/// A struct represnting the meal detail response.
struct MealDetailResponse: Decodable {
    let mealDetail: [MealDetail]?
    
    enum CodingKeys: String, CodingKey {
        case mealDetail = "meals"
    }
}

/// A struct representing the details of the meal.
struct MealDetail: Decodable, Identifiable {
    var id: String {idMeal}
    let idMeal: String
    let strMeal: String?
    let strInstructions: String?
    let strMealThumb: String?
    let ingredients: [Ingredient]?
}

/**
 Custom Decoder
 1. To Decode Values - id, name, instructions and ingredients array.
 2. To Exclude nil values
 3. To format the instruction string with numbers.
 */
extension MealDetail {
    
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
        strInstructions = MealDetail.formatInstructionString(mealDict["strInstructions"] as? String ?? "")
        strMealThumb = mealDict["strMealThumb"] as? String ?? ""
    }
    
    
    static private func formatInstructionString(_ str: String) -> String {
        var formattedString = ""
        
        // Split the input string
        let lines = str.components(separatedBy: "\r\n")
        var index = 1
        
        for line in lines {
            if !line.isEmpty {
                // Add numeric points and a new line
                formattedString.append("\(index). \(line)\n\r")
                index += 1
            }
        }
        return formattedString
    }
}


