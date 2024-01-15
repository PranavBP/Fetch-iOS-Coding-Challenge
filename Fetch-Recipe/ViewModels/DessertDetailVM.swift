//
//  DessertDetailVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import Foundation

class DessertDetailVM: ObservableObject {
    
    init() {}
    
    @Published private(set) var dessertDetails: DessertDetails? = nil
    
    /**
     func fetchDessertDetail(id: String)
     - parameter id: The dessert id
     - This function takes an id and uses it in the URL dynamically to fetch the dessert details.
     */
    func fetchDessertDetail(id: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            print("URL doesnt exist")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let dessertDetails = try JSONDecoder().decode(DessertData.self, from: data)
                var currentDessertDetails = DessertDetails()
                
                guard let dessert = dessertDetails.meals.first else {
                    return
                }
                let name = dessert["strMeal"] as? String ?? "No Name"
                let inst = dessert["strInstructions"] as? String ?? "No Instructions provided"
                let instPoints = self?.formatInstructionString(inst) ?? "No Instructions provided"
                let image = dessert["strMealThumb"] as? String ?? ""
                var ingredients: [Ingredient] = []
                
                // Assuming only max of 20 ingredients.
                for i in 1...20 {
                    // Validate and retrieve ingredient and measure data, checking for null values.
                    guard let ingredient = dessert["strIngredient\(i)"] as? String,
                          !ingredient.isEmpty,
                          let measure = dessert["strMeasure\(i)"] as? String,
                          !measure.isEmpty else {
                        break
                    }
                    ingredients.append(Ingredient(name: ingredient.uppercased(), measurement: measure))
                }
                
                currentDessertDetails = DessertDetails(name: name,
                                                       instructions: instPoints,
                                                       thumbnail: image,
                                                       ingredients: ingredients)
                DispatchQueue.main.async {
                    self?.dessertDetails = currentDessertDetails
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // For better formatting of the dessert recipe instructions.
    private func formatInstructionString(_ str: String) -> String {
        var formattedString = ""
        
        // Split the input string
        let lines = str.components(separatedBy: "\r\n")
        var index = 1
        
        for line in lines {
            // Add numeric points and a new line
            if !line.isEmpty {
                formattedString.append("\(index). \(line)\n\r")
                index += 1
            }
        }
        return formattedString
    }
}
