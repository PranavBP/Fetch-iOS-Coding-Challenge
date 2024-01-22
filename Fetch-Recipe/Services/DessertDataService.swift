//
//  DessertDataService.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/20/24.
//

import Foundation
import Combine

class DessertDataService {
    
    @Published var desserts: [Dessert] = []
    
    var dessertSubscription: AnyCancellable?
    
    init() {
        getDesserts()
    }
    
    private func getDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        // 5. Decode the good data into Dessert List Response Model.
        // 6. Put the data into our app.
        dessertSubscription = NetworkManager.download(url: url)
            .decode(type: DessertListResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedDesserts in
                self?.desserts = returnedDesserts.meals
                    .filter { !$0.strMeal.isEmpty && !$0.idMeal.isEmpty && !$0.strMealThumb.isEmpty }
                    .sorted { $0.strMeal < $1.strMeal }
                self?.dessertSubscription?.cancel()
            })
    }
}
