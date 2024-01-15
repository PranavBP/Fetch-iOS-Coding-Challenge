//
//  DessertView.swift
//  Fetch-Recipe
//
//  Created by Pranav Bellam Prasad on 1/12/24.
//

import SwiftUI

struct DessertListView: View {
    
    @StateObject var viewModel = DessertViewVM()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 170, maximum: 250), spacing: 0)], spacing: 16) {
                        ForEach(viewModel.desserts) { dessert in
                            NavigationLink(destination: DessertRecipeView(idMeal: dessert.id)) {
                                DessertCardView(dessert: dessert)
                            }
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Desserts")
                .onAppear {
                    viewModel.fetchData()
                }
            }
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    DessertListView()
}
