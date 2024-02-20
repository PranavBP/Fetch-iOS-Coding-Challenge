//
//  DessertDetailVM.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import Foundation
import Combine

class DessertDetailViewVM: ObservableObject {
    
    @Published private(set) var dessertDetails: Meals? = nil
    
    private let dessertId: String
    private let dataService: DessertDetailService
    private var cancellables = Set<AnyCancellable>()
    
    init(dessertId: String) {
        self.dessertId = dessertId
        self.dataService = DessertDetailService(dessertId: dessertId)
        addSubscribers()
    }
    
    // MARK: - 1. USING COMBINE
    
    func addSubscribers() {
        dataService.$dessertDetails
            .sink { [weak self] returnedDessertDetails in
                self?.dessertDetails = returnedDessertDetails
            }
            .store(in: &cancellables)
    }
    
    
    // MARK: - 2. USING URLSESSION DATATASK
    
    /**
     func fetchDessertDetail(id: String)
     - parameter id: The dessert id
     - This function takes an id and uses it in the URL dynamically to fetch the dessert details.
     */
    func fetchDessertDetails(with id: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            return
        }
        
        DispatchQueue.global(qos: .default).async {
            NetworkManager.downloadData(fromURL: url) { [weak self] resultData in
                if let data = resultData {
                    do {
                        let dessertDetails = try JSONDecoder().decode(MealsResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            guard let details = dessertDetails.meals?.first else {
                                return
                            }
                            self?.dessertDetails = details
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Network Error")
                }
            }
        }
    }
}
