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
                    
                    
                    VStack(spacing: 20) {
                        Text(dessertDetail.name)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Instructions:")
                                .font(.title2)
                                .bold()
                            
                            Text(dessertDetail.instructions)
                            
                            
                            Text("Ingredients List:")
                                .font(.title2)
                                .bold()
                                
                                ForEach(dessertDetail.ingredients, id: \.self) { ingredient in
                                    HStack {
                                        Text(ingredient.name)
                                            .font(.body)
                                        
                                        Spacer()
                                        
                                        Text(ingredient.measurement)
                                            .bold()
                                    }
                                }
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
    DessertRecipeView(idMeal: "52855")
}
