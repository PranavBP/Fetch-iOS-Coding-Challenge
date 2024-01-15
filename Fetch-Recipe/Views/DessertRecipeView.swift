//
//  DessertRecipeView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct DessertRecipeView: View {
    
    let idMeal: String
    @StateObject private var viewModel = DessertDetailVM()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                if let dessertDetail = viewModel.dessertDetails {
                    
                    // MARK: - DESSERT IMAGE
                    // Using Async Image - iOS15 +
                    
                    AsyncImage(url: URL(string: dessertDetail.thumbnail)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .opacity(0.8)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 400)
                    .background(Color.gray)
                    
                    // MARK: - DESSERT DETAILS
                    
                    VStack(spacing: 20) {
                        Text(dessertDetail.name)
                            .font(.custom("Avenir-Black", size: 34.0))
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // MARK: - DESSERT INGREDIENTS
                            
                            Text("Ingredients:")
                                .font(.custom("Avenir-Medium", size: 24.0))
                                .bold()
                            
                            ForEach(dessertDetail.ingredients, id: \.self) { ingredient in
                                HStack {
                                    Text(ingredient.name)
                                    
                                    Spacer()
                                    
                                    Text(ingredient.measurement)
                                        .bold()
                                }
                                .font(.custom("Avenir", size: 15.0))
                            }
                            
                            // MARK: - DESSERT RECIPE INSTRUCTIONS
                            
                            Text("Instructions:")
                                .font(.custom("Avenir-Medium", size: 24.0))
                                .bold()
                            
                            Text(dessertDetail.instructions)
                                .font(.custom("Avenir", size: 16.0))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                } else {
                    VStack {
                        ProgressView("Loading...")
                            .padding()
                            .frame(width: geometry.size.width)
                            .frame(minHeight: geometry.size.height)
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            .onAppear() {
                viewModel.fetchDessertDetail(id: idMeal)
            }
        }
    }
}

#Preview {
    // Preview for Banana Pancakes Recipe
    DessertRecipeView(idMeal: "52855")
}
