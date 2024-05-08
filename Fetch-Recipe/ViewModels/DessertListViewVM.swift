//
//  DessertViewVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import Foundation

class DessertListViewVM: ObservableObject {
    
    @Published private(set) var desserts: [Meal]? = nil
    @Published private(set) var error: String?
    
    init() {
        fetchData()
    }
    
    /// Fetch all the Dessert Data.
    func fetchData() {
        guard let url = Endpoint.filter(mealType: "Dessert").url else { return }
        
        DispatchQueue.global(qos: .default).async {
            ServiceManager.shared.execute(url, expecting: MealsListResponse.self) { result in
                switch result {
                case .success(let dessertListResponse):
                    DispatchQueue.main.async { [weak self] in
                        // 1. Handling null values.
                        // 2. Sorting alphabetically.
                        self?.desserts = dessertListResponse.meals
                            .filter { !$0.strMeal.isEmpty && !$0.idMeal.isEmpty && !$0.strMealThumb.isEmpty }
                            .sorted { $0.strMeal < $1.strMeal }
                    }
                case .failure(let error):
                    DispatchQueue.main.async { [weak self] in
                        self?.error = error.desc
                    }
                }
            }
        }
    }
}
