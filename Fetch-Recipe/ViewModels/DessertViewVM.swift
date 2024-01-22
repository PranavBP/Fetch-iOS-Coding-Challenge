//
//  DessertViewVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/11/24.
//

import Foundation
import Combine

class DessertViewVM: ObservableObject {
    
    @Published private(set) var desserts: [Dessert] = []
    
    private let dataService = DessertDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$desserts
            .sink { [weak self] returnedDesserts in
                self?.desserts = returnedDesserts
            }
            .store(in: &cancellables)
    }
    
    
    
    
    // MARK: - USING URLSESSION DATATASK
    
    /// Fetch all the Dessert Data.
    func fetchData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("URL is invalid or doesn't exist")
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")
            
            NetworkManager.downloadData(fromURL: url) { [weak self] resultData in
                if let data = resultData {
                    do {
                        let desserts = try JSONDecoder().decode(DessertListResponse.self, from: data)
                        
                        // 1. Handling null values.
                        // 2. Sorting alphabetically.
                        let filteredDesserts = desserts.meals
                            .filter { !$0.strMeal.isEmpty && !$0.idMeal.isEmpty && !$0.strMealThumb.isEmpty }
                            .sorted { $0.strMeal < $1.strMeal }
                        
                        DispatchQueue.main.async { [weak self] in
                            
                            print("Check 2: \(Thread.isMainThread)")
                            print("Check 2: \(Thread.current)")
                            
                            self?.desserts = filteredDesserts
                        }
                        
                    } catch {
                        print("Error")
                    }
                } else {
                    print("No data was returned")
                }
            }
        }
    }
    
}
