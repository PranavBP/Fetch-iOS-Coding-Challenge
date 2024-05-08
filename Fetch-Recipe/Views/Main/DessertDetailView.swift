//
//  DessertRecipeView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 5/6/24.
//

import SwiftUI

struct DessertDetailView: View {
    
    @StateObject private var viewModel: DessertDetailViewVM
    @State private var dessertID: String
    
    @Environment(\.presentationMode) var presentationMode
    
    init(idMeal: String) {
        self.dessertID = idMeal
        _viewModel = StateObject(wrappedValue: DessertDetailViewVM(dessertId: idMeal))
    }
    
    var body: some View {
        
        if let dessertDetail = viewModel.dessertDetails {
            ScrollView {
                // MARK: - DESSERT IMAGE
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: dessertDetail.strMealThumb ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay {
                                LinearGradient(
                                    colors: [Color.clear, Color.clear, Color(UIColor.systemBackground)],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            }
                        
                    } placeholder: {
                        PlaceholderImageView()
                    }
                    .frame(height: 400)
                    
                    CircularCloseButton()
                }
                
                // MARK: - DESSERT DETAILS
                
                VStack(spacing: 15) {
                    Text(dessertDetail.strMeal ?? "Title")
                        .titleStyle()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        // MARK: - DESSERT INGREDIENTS
                        
                        Text("Ingredients:")
                            .subTitleStyle()
                        
                        ForEach(dessertDetail.ingredients ?? []) { ingredient in
                            IngredientRowView(ingredient: ingredient)
                        }
                        
                        Divider()
                            .padding(8.0)
                        
                        // MARK: - DESSERT RECIPE INSTRUCTIONS
                        
                        Text("Instructions:")
                            .subTitleStyle()
                        
                        Text(dessertDetail.strInstructions ?? "No Instructions provided.")
                            .bodyTextStyle(isBold: false)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .ignoresSafeArea(.container, edges: .top)
        } else if let error = viewModel.error {
            ErrorView(errorString: error) {
                viewModel.fetchDessertDetail(with: dessertID)
            }
        }
        else {
            LoaderView()
        }
    }
}

#Preview {
    DessertDetailView(idMeal: "52857")
}
