//
//  DessertViewVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/11/24.
//

import Foundation
import Combine

class DessertListViewVM: ObservableObject {
    
    @Published private(set) var desserts: [Dessert] = []
    
    private let dataService = DessertDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        /*
         1. Use addSubscribers to use Combine API to fetch data.
         2. Use `fetchData()` to use URLSession datatask to fetch data.
         */
        //addSubscribers()
        fetchData()
    }
    
    // MARK: - 1. USING COMBINE
    
    func addSubscribers() {
        dataService.$desserts
            .sink { [weak self] returnedDesserts in
                self?.desserts = returnedDesserts
            }
            .store(in: &cancellables)
    }
    
    // MARK: - 2. USING URLSESSION DATATASK
    
    /// Fetch all the Dessert Data.
    private func fetchData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
        
        DispatchQueue.global(qos: .default).async {
            ServiceManager.shared.execute(url, expecting: DessertListResponse.self) { result in
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
                    print("Error: \(error)")
                }
            }
        }
    }
    
}
