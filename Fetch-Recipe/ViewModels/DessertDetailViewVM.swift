//
//  DessertDetailVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/7/24.
//

import Foundation

class DessertDetailViewVM: ObservableObject {
    
    @Published private(set) var dessertDetails: MealDetail? = nil
    @Published private(set) var error: String? = nil
    
    private let dessertId: String
    
    init(dessertId: String) {
        self.dessertId = dessertId
        fetchDessertDetail(with: dessertId)
    }
    
    /// This function takes an mealId and uses it in the URL dynamically to fetch the dessert details.
    /// - Parameter mealId: Dessert ID
    func fetchDessertDetail(with mealId: String) {
        guard let url = Endpoint.lookup(id: mealId).url else { return }
        
        DispatchQueue.global(qos: .default).async {
            ServiceManager.shared.execute(url, expecting: MealDetailResponse.self) { result in
                switch result {
                case .success(let mealDetailResponse):
                    DispatchQueue.main.async { [weak self] in
                        guard let details = mealDetailResponse.mealDetail?.first else {
                            return
                        }
                        self?.dessertDetails = details
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
