//
//  DessertRecipeView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct DessertDetailView: View {
    
    @StateObject private var viewModel: DessertDetailViewVM
    
    @Environment(\.presentationMode) var presentationMode
    
    init(idMeal: String) {
        _viewModel = StateObject(wrappedValue: DessertDetailViewVM(dessertId: idMeal))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            if let dessertDetail = viewModel.dessertDetails {
                
                // MARK: - DESSERT IMAGE
                // Using Async Image - iOS15 +
                
                ZStack(alignment: .topLeading) {
                    
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
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 400)
                    .background(Color.gray)
                    
                    // CLOSE Button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 25)
                            .padding()
                    })
                }
                
                // MARK: - DESSERT DETAILS
                
                VStack(spacing: 15) {
                    Text(dessertDetail.strMeal ?? "")
                        .font(.custom("Avenir-Black", size: 34.0))
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        // MARK: - DESSERT INGREDIENTS
                        
                        Text("Ingredients:")
                            .font(.custom("Avenir-Medium", size: 24.0))
                            .bold()
                        
                        ForEach(dessertDetail.ingredients ?? []) { ingredient in
                            IngredientRowView(ingredient: ingredient)
                        }
                        
                        Divider()
                            .padding(.top, 8.0)
                        
                        // MARK: - DESSERT RECIPE INSTRUCTIONS
                        
                        Text("Instructions:")
                            .font(.custom("Avenir-Medium", size: 24.0))
                            .bold()
                        
                        Text(dessertDetail.strInstructions ?? "")
                            .font(.custom("Avenir", size: 16.0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                
            } else {
                VStack {
                    ProgressView("Loading...")
                        .padding()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    // Preview for Banana Pancakes Recipe
    DessertDetailView(idMeal: "52855")
}
