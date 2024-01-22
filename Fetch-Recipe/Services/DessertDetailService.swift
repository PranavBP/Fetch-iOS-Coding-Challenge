//
//  DessertDetailService.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/21/24.
//

import Foundation
import Combine

class DessertDetailService {
    
    @Published var dessertDetails: Meals? = nil
    
    var dessertDetailSubscription: AnyCancellable?
    private let dessertId: String
    
    init(dessertId: String) {
        self.dessertId = dessertId
        getDessertDetails()
    }
    
    func getDessertDetails() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessertId)") else {
            return
        }
        
        dessertDetailSubscription = NetworkManager.download(url: url)
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedDessertDetails in
                self?.dessertDetails = returnedDessertDetails.meals?.first
                self?.dessertDetailSubscription?.cancel()
            })
    }
    
}
