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
                
                for meal in dessertDetails.meals {
                    let name = meal["strMeal"] as? String
                    let inst = meal["strInstructions"] as? String
                    let image = meal["strMealThumb"] as? String ?? ""
                    var ingredients: [Ingredient] = []
                    
                    // Assuming only max of 20 ingredients.
                    for i in 1...20 {
                        // Checking for null values in ingredient.
                        guard let ingredient = meal["strIngredient\(i)"] as? String,
                              !ingredient.isEmpty,
                              let measure = meal["strMeasure\(i)"] as? String,
                              !measure.isEmpty else {
                            break
                        }
                        ingredients.append(Ingredient(name: ingredient.uppercased(), measurement: measure))
                    }
                    
                    currentDessertDetails = DessertDetails(name: name ?? "No Name",
                                                        instructions: inst ?? "No Instructions provided",
                                                        thumbnail: image,
                                                        ingredients: ingredients)
                }
                DispatchQueue.main.async {
                    self?.dessertDetails = currentDessertDetails
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
