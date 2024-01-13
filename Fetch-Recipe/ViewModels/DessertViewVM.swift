//
//  DessertViewVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/11/24.
//

import Foundation

class DessertViewVM: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    
    func fetchData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let desserts = try JSONDecoder().decode(DessertListResponse.self, from: data)
                
                // Handling null values and sorting alphabetically
                let filteredDesserts = desserts.meals
                    .filter { !$0.strMeal.isEmpty && !$0.idMeal.isEmpty && !$0.strMealThumb.isEmpty }
                    .sorted { $0.strMeal < $1.strMeal }
                
                DispatchQueue.main.async {
                    self?.desserts = filteredDesserts
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
